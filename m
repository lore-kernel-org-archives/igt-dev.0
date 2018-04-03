Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553BF6E2B4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Apr 2018 08:41:32 +0000 (UTC)
References: <1522656854-19558-1-git-send-email-vidya.srinivas@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <de96729c-c882-3c6e-52b4-7bd508313d2c@linux.intel.com>
Date: Tue, 3 Apr 2018 10:41:30 +0200
MIME-Version: 1.0
In-Reply-To: <1522656854-19558-1-git-send-email-vidya.srinivas@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: fb height to
 be min 16 for NV12
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
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
Cc: sunil.kamath@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDItMDQtMTggb20gMTA6MTQgc2NocmVlZiBWaWR5YSBTcmluaXZhczoKPiBQZXIgQnNwZWMs
IGZiIGhlaWdodCBuZWVkcyB0byBiZSBtaW4gMTYgZm9yIE5WMTIgKFlVViBwbGFuYXIKPiBmb3Jt
YXRzKS4gV2UgYWxzbyBuZWVkIHRoZSBzcmMgaGVpZ2h0IGFuZCB3aWR0aCB0byBiZQo+IG11bHRp
cGxlIG9mIDQuCj4KPiBSZXZpZXdlZC1CeTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpZHlhIFNyaW5pdmFzIDx2aWR5
YS5zcmluaXZhc0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxh
bmVfc2NhbGluZy5jCj4gaW5kZXggMzZmY2ZjMC4uOWQzZmU5NSAxMDA2NDQKPiAtLS0gYS90ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZy5jCj4gKysrIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+
IEBAIC0xMzIsNyArMTMyLDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfc2NhbGluZ19waXBlX3BsYW5l
X3JvdChkYXRhX3QgKmQsIGlndF9wbGFuZV90ICpwbGFuZSwKPiAgCS8qIGNyZWF0ZSBidWZmZXIg
aW4gdGhlIHJhbmdlIG9mICBtaW4gYW5kIG1heCBzb3VyY2Ugc2lkZSBsaW1pdC4qLwo+ICAJd2lk
dGggPSBoZWlnaHQgPSA5Owo+ICAJaWYgKHBpeGVsX2Zvcm1hdCA9PSBEUk1fRk9STUFUX05WMTIp
Cj4gLQkJd2lkdGggPSBoZWlnaHQgPSAxNzsKPiArCQl3aWR0aCA9IGhlaWdodCA9IDE2Owo+ICAJ
aWd0X2NyZWF0ZV9jb2xvcl9mYihkaXNwbGF5LT5kcm1fZmQsIHdpZHRoLCBoZWlnaHQsCj4gIAkJ
ICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4wLCAmZC0+ZmJbMF0pOwo+
ICAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJmQtPmZiWzBdKTsKClB1c2hlZCwgdGhhbmtzLgoK
SG9wZWZ1bGx5IHdlIGNhbiBnZXQgdGhlIGtlcm5lbCBpc3N1ZXMgc29ydGVkIG91dCBhbmQgaGF2
ZSBmdWxsIHRlc3QgY292ZXJhZ2UgbmV4dCB0aW1lIGtlcm5lbCBOVjEyIHNlcmllcyBhcmUgc2Vu
dC4gOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
