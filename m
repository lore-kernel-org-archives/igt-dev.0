Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60D36E823
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 10:49:38 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <1521092542-1288-1-git-send-email-vidya.srinivas@intel.com>
References: <1521092542-1288-1-git-send-email-vidya.srinivas@intel.com>
Date: Thu, 15 Mar 2018 12:50:32 +0200
Message-ID: <87woydliiv.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: Change
 minimum fb height for YUV 420 planar
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
Cc: sunil.kamath@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAxNSBNYXIgMjAxOCwgVmlkeWEgU3Jpbml2YXMgPHZpZHlhLnNyaW5pdmFzQGludGVs
LmNvbT4gd3JvdGU6Cj4gV2hlbiB0aGUgcGxhbmUgc2NhbGluZyBpcyB1c2VkIHdpdGggWVVWIDQy
MCBwbGFuYXIgZm9ybWF0cywKPiB0aGUgaGVpZ2h0IHNob3VsZCBiZSBhIG1pbmltdW0gb2YgMTYg
c2NhbmxpbmVzIGFzIHBlciBCU3BlYy4KPiBNaW5pbXVtIG9mIDggc2NhbmxpbmVzIGlzIGZvciBu
b24tWVVWIDQyMCBwbGFuYXIgZm9ybWF0cy4KPiBQYXRjaCBjaGFuZ2VzIHRoZSBtaW5pbXVtIGZi
IGhlaWdodCBiZWluZyB1c2VkIGluIHRoZSB0ZXN0Cj4gaW4gY2FzZSBvZiBZVVYgNDIwIHBsYW5h
ciAoY3VycmVudGx5IGRvbmUgZm9yIE5WMTIsIGFzCj4gdGhhdCBpcyB0aGUgb25seSBwbGFuYXIg
Zm9ybWF0IHN1cHBvcnRlZCkKPgo+IHYyOiBBZGRyZXNzZWQgcmV2aWV3IGNvbW1lbnRzIGZyb20g
TWFhcnRlbgoKVGhpcyBkb2Vzbid0IHJlYWxseSBzYXkgYW55dGhpbmcgbWVhbmluZ2Z1bC4gSW4g
dGhlIGZ1dHVyZSwgcGxlYXNlIHN0YXRlCnRoZSBhY3R1YWwgY2hhbmdlcy4KCj4gU2lnbmVkLW9m
Zi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyBiL3Rlc3Rz
L2ttc19wbGFuZV9zY2FsaW5nLmMKPiBpbmRleCA0NDA4ZTVjLi4zNmZjZmMwIDEwMDY0NAo+IC0t
LSBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKPiArKysgYi90ZXN0cy9rbXNfcGxhbmVfc2Nh
bGluZy5jCj4gQEAgLTEzMSw2ICsxMzEsOCBAQCBzdGF0aWMgdm9pZCBjaGVja19zY2FsaW5nX3Bp
cGVfcGxhbmVfcm90KGRhdGFfdCAqZCwgaWd0X3BsYW5lX3QgKnBsYW5lLAo+ICAKPiAgCS8qIGNy
ZWF0ZSBidWZmZXIgaW4gdGhlIHJhbmdlIG9mICBtaW4gYW5kIG1heCBzb3VyY2Ugc2lkZSBsaW1p
dC4qLwo+ICAJd2lkdGggPSBoZWlnaHQgPSA5Owo+ICsJaWYgKHBpeGVsX2Zvcm1hdCA9PSBEUk1f
Rk9STUFUX05WMTIpCj4gKwkJd2lkdGggPSBoZWlnaHQgPSAxNzsKCklNTyBpdCdzIGVhc2llciB0
byByZWFkIHdoZW4geW91IGhhdmUgYW4gaWYtZWxzZSBpbnN0ZWFkIG9mIG92ZXJ3cml0aW5nCnRo
ZSBwcmV2aW91cyB2YWx1ZXMgaW4gc29tZSBjYXNlcy4KCkJSLApKYW5pLgoKPiAgCWlndF9jcmVh
dGVfY29sb3JfZmIoZGlzcGxheS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LAo+ICAJCSAgICAgICBw
aXhlbF9mb3JtYXQsIHRpbGluZywgMC4wLCAxLjAsIDAuMCwgJmQtPmZiWzBdKTsKPiAgCWlndF9w
bGFuZV9zZXRfZmIocGxhbmUsICZkLT5mYlswXSk7CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9w
ZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
