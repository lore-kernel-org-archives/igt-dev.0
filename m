Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170536E176
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 12:31:42 +0000 (UTC)
Date: Thu, 14 Mar 2019 14:31:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190314123138.GP3888@intel.com>
References: <20190313201219.7804-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313201219.7804-1-nicholas.kazlauskas@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Set output to
 PIPE_NONE at end of test_format_plane
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
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTMsIDIwMTkgYXQgMDQ6MTI6MTlQTSAtMDQwMCwgTmljaG9sYXMgS2F6bGF1
c2thcyB3cm90ZToKPiBBTURHUFUgcmVqZWN0cyBjb21taXRzIHRoYXQgaGF2ZSBhbiBhY3RpdmUg
Q1JUQyB3aXRob3V0IGFuIGFjdGl2ZQo+IHByaW1hcnkgcGxhbmUuCj4gCj4gVGhlIHBpeGVsLWZv
cm1hdC1waXBlLSogdGVzdHMgZmFpbCBvbiBBTURHUFUgZHVyaW5nIHRoZSBjbGVhbnVwIGF0Cj4g
dGhlIGVuZCBvZiB0aGUgdGVzdCBkdWUgdG8gdGhlIGZpbmFsIGNvbW1pdCBkaXNhYmxpbmcgYWxs
IHRoZSBwbGFuZXMgYnV0Cj4gbm90IHRoZSBDUlRDLgo+IAo+IERpc2FibGUgdGhlIENSVEMgd2hl
biBjbGVhbmluZyB1cCBieSBzZXR0aW5nIHRoZSBvdXRwdXQgdG8gUElQRV9OT05FLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1k
LmNvbT4KClJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgoKPiAtLS0KPiAgdGVzdHMva21zX3BsYW5lLmMgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5j
IGIvdGVzdHMva21zX3BsYW5lLmMKPiBpbmRleCA5YzMzMGFlNC4uOTY5YTYxYzggMTAwNjQ0Cj4g
LS0tIGEvdGVzdHMva21zX3BsYW5lLmMKPiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYwo+IEBAIC01
ODYsNiArNTg2LDcgQEAgc3RhdGljIGJvb2wgdGVzdF9mb3JtYXRfcGxhbmUoZGF0YV90ICpkYXRh
LCBlbnVtIHBpcGUgcGlwZSwKPiAgCj4gIAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksIE5VTEwp
Owo+ICAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgTlVMTCk7Cj4gKwlpZ3Rfb3V0cHV0X3NldF9w
aXBlKG91dHB1dCwgUElQRV9OT05FKTsKPiAgCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRp
c3BsYXksIGRhdGEtPmRpc3BsYXkuaXNfYXRvbWljID8gQ09NTUlUX0FUT01JQyA6IENPTU1JVF9M
RUdBQ1kpOwo+ICAKPiAgCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZmIpOwo+IC0tIAo+
IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
