Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A7A89C56
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 16:34:26 +0000 (UTC)
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Tue, 16 Apr 2019 16:34:24 +0000
Message-ID: <ebc43d53b6b05e95c353c1d5ddd56fceead3b279.camel@intel.com>
References: <cover.1555430824.git.neel.desai@intel.com>
 <669c0091ff05a3969d75418cb0e6c064b2cd6092.1555430824.git.neel.desai@intel.com>
In-Reply-To: <669c0091ff05a3969d75418cb0e6c064b2cd6092.1555430824.git.neel.desai@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_chamelium: Increase timeout
 for CaptureVideo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1944924532=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Desai, Neel" <neel.desai@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1944924532==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-uYpxySO6ebaJ87gm9QtY"

--=-uYpxySO6ebaJ87gm9QtY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-16 at 09:13 -0700, Neel Desai wrote:
> For some chamelium boards, we observed that the chamelium_rpc()
> call with method_name as CaptureVideo timed out because the display
> resolution read by the FPGA using the VideoDumper did not match the
> resolution in the RX chip. The resolution read by the FPGA from the
> memory was incorrect after 10 seconds and needed more time to
> stabilize
> to the correct value.
>=20
> So, instead of checking the chamelium->env.fault_occured in the
> chamelium_rpc() funtion, we defer the check in the parent function
> chamelium_capture(). We iterate upto 10 times if chamelium_rpc() with
> method name as CaptureVideo fails thus effectively increasing the
> timeout to 100 seconds instead if 10 seconds. If after 10 iterations,
> chamelium->env.fault_occured is still set, we return an error.
>=20
> This looks like an issue from Google's end in the FPGA code. This
> patch
> introduces a workaround till we get the issue resolved from Google's
> end.
>=20
> Signed-off-by: Neel Desai <neel.desai@intel.com>
> ---
>  lib/igt_chamelium.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 02cc9b2c..497d4421 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -301,6 +301,25 @@ static xmlrpc_value *chamelium_rpc(struct
> chamelium *chamelium,
>  		igt_cleanup_hotplug(monitor_args.mon);
>  	}
> =20
> +	/*
> +	 * For some chamelium boards, we observed that the
> +	 * chamelium_rpc() call with method_name as CaptureVideo timed
> +	 * out because the display resolution read by the FPGA using
> +	 * VideoDumper did not match the resolution in the rx chip. The
> +	 * resolution read by the FPGA from the memory was
> +	 * incorrect and needed more time to stabilize to the correct
> +	 * value. So, instead of checking the
> +	 * chamelium->env.fault_occured here, we defer checking in the
> +	 * parent (chamelium_capture()) call and retry for 10 times.
> +	 * This increases the timeout to 100 seconds instead of 10
> +	 * seconds for CaptureVideo. After 10 iterations of
> +	 * chamelium_rpc with method_name as CaptureVideo if the
> +	 * chamelium->env.fault_occured is still set, we return an
> +	 * error.
> +	 */
> +	if (!strcmp(method_name, "CaptureVideo"))
> +		return res;
> +

Why not make this a standard capability for all RPC interaction? What
if we hit this in one of the other calls?

-Stuart

>  	igt_assert_f(!chamelium->env.fault_occurred,
>  		     "Chamelium RPC call failed: %s\n",
>  		     chamelium->env.fault_string);
> @@ -838,9 +857,19 @@ void chamelium_stop_capture(struct chamelium
> *chamelium, int frame_count)
>  void chamelium_capture(struct chamelium *chamelium, struct
> chamelium_port *port,
>  		       int x, int y, int w, int h, int frame_count)
>  {
> -	xmlrpc_DECREF(chamelium_rpc(chamelium, port, "CaptureVideo",
> +	int iter =3D 0;
> +	xmlrpc_value *res;
> +	do {
> +		res =3D chamelium_rpc(chamelium, port, "CaptureVideo",
>  				    (w && h) ? "(iiiiii)" : "(iinnnn)",
> -				    port->id, frame_count, x, y, w,
> h));
> +				    port->id, frame_count, x, y, w, h);
> +		iter++;
> +	} while (chamelium->env.fault_occurred && iter < 10);
> +
> +	igt_assert_f(!chamelium->env.fault_occurred,
> +		     "Chamelium RPC call failed: %s\n",
> +		     chamelium->env.fault_string);
> +	xmlrpc_DECREF(res);
>  	chamelium->capturing_port =3D port;
>  }
> =20

--=-uYpxySO6ebaJ87gm9QtY
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
PwuHX1mRETAlwqXCZa6ba8eraUCltlCb/ZiEk9UFRVLjbLNPh9IYOi+sWkS6n5CovLKAqhMCAwEA
AaOCAjMwggIvMB0GA1UdDgQWBBSgeYqvLV4nBaCUzAXLr0TeMJYR5zAfBgNVHSMEGDAWgBTaQSOc
Wo9xr1eDPiDT42XbDMsL2zBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVsLmNvbS9y
ZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0
Qi5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMCIGCCsGAQUFBzABhhZodHRwOi8vb2NzcC5pbnRlbC5j
b20vMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3LmludGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmlj
YXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0Qi5jcnQwCwYD
VR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJ
Z4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYBBAGC
NxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME0GA1UdEQRGMESgKAYKKwYBBAGCNxQC
A6AaDBhzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb22BGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAfyIC7rzSi6S8O+sdH384K8zyeMRJnl6vR7whl9PuEat+BkKpoxHn
jQ0SFyF/cyI4lH/n938Pm3/Ctq0Z5GTldX6hhxxcLAR0qbk6AQU0Cq2nYMlZfX4FUz3FRsazbjTW
1qObcvPRUAVScaa7SRGdensvbNV++pN1XqEdc++szxo58UzPaEgDlHIe2sEIVXnFkHnJv0ikRHG3
urcA1bdj7Rac7dJBeQOQMdZEGmrWWmmbJzvk3OmoK9tKN7wcErQSdlqyYOMLesPfa7YNyLFYEJQd
CC/N7V8U9yFZx8akWREb8lJYDl9KypirEsufleiew26CWrwcbmdlldDCFS6/HDGCAhcwggITAgEB
MIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAY
BgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJ
c3N1aW5nIENBIDRCAhMzAAB04Th3owY0UbEUAAAAAHThMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA0MTYxNjM0MjFaMCMGCSqGSIb3DQEJ
BDEWBBRdSkU1hPP1Bmxq5er/zN9iCMBEADANBgkqhkiG9w0BAQEFAASCAQAMQ2mzuqCyANKSHrXL
kWHD5ugkgyXaYwrz+t4niF+0g2N8/msiPP3psul4sybEU9GPeV2H1C1Cf+tw9a8aw36jom+DH02d
tXyxzgSIhNC5CPNICHDhYOvixvpIHEjQmPhaxbTNp5T3BIBkv5VbvppiUXeKq4fOKh+673kvzmDB
a5eUqqHI/MKmyD+qf0lLjiZJhfs0hb5BCl9OAJIuSqHz2NY9kJjPEPd+tzz8N9D/z7Opc9MiCRWW
yjQpIkrcgMe/+Vw8bXPubSTmXo7DU6hn1h77GMDo6DYdBZgs/WepdVLwcjXQvtt0nboghdDnsaLZ
yjML5FYytA9XmFkdhlPVAAAAAAAA


--=-uYpxySO6ebaJ87gm9QtY--

--===============1944924532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1944924532==--
