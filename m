Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F466E03B
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 15:29:41 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191120145712.27496-1-ramalingam.c@intel.com>
References: <20191120145712.27496-1-ramalingam.c@intel.com>
Message-ID: <157426374430.13839.16882524321965586975@skylake-alporthouse-com>
Date: Wed, 20 Nov 2019 15:29:04 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/WA: Mark FF_MODE2 as WO for
 TGL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ramalingam C <ramalingam.c@intel.com>, igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSYW1hbGluZ2FtIEMgKDIwMTktMTEtMjAgMTQ6NTc6MTIpCj4gT24gVEdMIHRpbGwg
QjAgc3RlcHBpbmcgRkZfTU9ERTIoMHg2NjA0KSByZWdpc3RlciBpcyBub3QgcmVhZGFibGUuIEJ1
dAo+IHdlIG5lZWQgdG8gcHJvZ3JhbSB0aGlzIHJlZ2lzdGVyIGZvciBXYV8xNjA0NTU1NjA3IGZv
ciBiZXR0ZXIKPiBwZXJmb3JtYW5jZS4gSGVuY2UgdG8gc2tpcCB0aGUgdmVyaWZpY2F0aW9uIGF0
dGVtcHQgb24gdGhpcyByZWdpc3Rlcgo+IHRocm91Z2ggcmVhZCwgd2UgYXJlIG1hcmtpbmcgdGhp
cyByZWdpc3RlciBhcyB3cml0ZSBvbmx5Lgo+IAo+IEFzIG9mIG5vdyBJIGhhdmUgbWFya2VkIHRo
aXMgcmVnaXN0ZXIgYXMgd3JpdGUgb25seSBmb3IgZ2VuMTIsIHdlIGNhbgo+IG5hcnJvdyBpdCBk
b3duIHRvIFRHTCA8PSBCMCwgaWYgd2UgY2FuIHJldHJpZXZlIHRoZSBzdGVwcGluZyBvZiB0aGUK
PiBwbGF0Zm9ybSBhdCBJR1QuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1h
bGluZ2FtLmNAaW50ZWwuY29tPgo+IGNjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5A
bGludXguaW50ZWwuY29tPgo+IGNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fd29ya2Fyb3VuZHMuYyB8IDQgKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pOTE1L2dlbV93b3JrYXJvdW5kcy5jIGIvdGVzdHMvaTkxNS9nZW1fd29y
a2Fyb3VuZHMuYwo+IGluZGV4IGRkNjMxNmVhM2I0ZS4uNTdkMzA3Yjk5OTFiIDEwMDY0NAo+IC0t
LSBhL3Rlc3RzL2k5MTUvZ2VtX3dvcmthcm91bmRzLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV93
b3JrYXJvdW5kcy5jCj4gQEAgLTUxLDggKzUxLDggQEAgc3RhdGljIHN0cnVjdCB3cml0ZV9vbmx5
X2xpc3Qgewo+ICAgICAgICAgdW5zaWduZWQgaW50IGdlbjsKPiAgICAgICAgIHVpbnQzMl90IGFk
ZHI7Cj4gIH0gd29fbGlzdFtdID0gewo+IC0gICAgICAgeyAxMCwgMHhFNUYwIH0gLyogV2FGb3Jj
ZUNvbnRleHRTYXZlUmVzdG9yZU5vbkNvaGVyZW50OmNubCAqLwo+IC0KPiArICAgICAgIHsgMTAs
IDB4RTVGMCB9LCAvKiBXYUZvcmNlQ29udGV4dFNhdmVSZXN0b3JlTm9uQ29oZXJlbnQ6Y25sICov
Cj4gKyAgICAgICB7IDEyLCAweDY2MDQgfSAgLyogRklYTUU6IFN0ZXBwaW5nID4gQjAgbWlnaHQg
YmUgcmVhZGFibGUgKi8KClNhdmUgdHJvdWJsZSBmb3IgbmV4dCB0aW1lLCBhZGQgdGhlICcsJy4K
QWNrZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
