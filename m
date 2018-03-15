Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715766E32F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 17:03:10 +0000 (UTC)
References: <1521092542-1288-1-git-send-email-vidya.srinivas@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <37079aa6-88b6-1f09-6224-02b5f3dafe7a@linux.intel.com>
Date: Thu, 15 Mar 2018 18:03:08 +0100
MIME-Version: 1.0
In-Reply-To: <1521092542-1288-1-git-send-email-vidya.srinivas@intel.com>
Content-Language: en-US
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

T3AgMTUtMDMtMTggb20gMDY6NDIgc2NocmVlZiBWaWR5YSBTcmluaXZhczoKPiBXaGVuIHRoZSBw
bGFuZSBzY2FsaW5nIGlzIHVzZWQgd2l0aCBZVVYgNDIwIHBsYW5hciBmb3JtYXRzLAo+IHRoZSBo
ZWlnaHQgc2hvdWxkIGJlIGEgbWluaW11bSBvZiAxNiBzY2FubGluZXMgYXMgcGVyIEJTcGVjLgo+
IE1pbmltdW0gb2YgOCBzY2FubGluZXMgaXMgZm9yIG5vbi1ZVVYgNDIwIHBsYW5hciBmb3JtYXRz
Lgo+IFBhdGNoIGNoYW5nZXMgdGhlIG1pbmltdW0gZmIgaGVpZ2h0IGJlaW5nIHVzZWQgaW4gdGhl
IHRlc3QKPiBpbiBjYXNlIG9mIFlVViA0MjAgcGxhbmFyIChjdXJyZW50bHkgZG9uZSBmb3IgTlYx
MiwgYXMKPiB0aGF0IGlzIHRoZSBvbmx5IHBsYW5hciBmb3JtYXQgc3VwcG9ydGVkKQo+Cj4gdjI6
IEFkZHJlc3NlZCByZXZpZXcgY29tbWVudHMgZnJvbSBNYWFydGVuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZp
ZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2tt
c19wbGFuZV9zY2FsaW5nLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21z
X3BsYW5lX3NjYWxpbmcuYwo+IGluZGV4IDQ0MDhlNWMuLjM2ZmNmYzAgMTAwNjQ0Cj4gLS0tIGEv
dGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+ICsrKyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5n
LmMKPiBAQCAtMTMxLDYgKzEzMSw4IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3NjYWxpbmdfcGlwZV9w
bGFuZV9yb3QoZGF0YV90ICpkLCBpZ3RfcGxhbmVfdCAqcGxhbmUsCj4gIAo+ICAJLyogY3JlYXRl
IGJ1ZmZlciBpbiB0aGUgcmFuZ2Ugb2YgIG1pbiBhbmQgbWF4IHNvdXJjZSBzaWRlIGxpbWl0Liov
Cj4gIAl3aWR0aCA9IGhlaWdodCA9IDk7Cj4gKwlpZiAocGl4ZWxfZm9ybWF0ID09IERSTV9GT1JN
QVRfTlYxMikKPiArCQl3aWR0aCA9IGhlaWdodCA9IDE3Owo+ICAJaWd0X2NyZWF0ZV9jb2xvcl9m
YihkaXNwbGF5LT5kcm1fZmQsIHdpZHRoLCBoZWlnaHQsCj4gIAkJICAgICAgIHBpeGVsX2Zvcm1h
dCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4wLCAmZC0+ZmJbMF0pOwo+ICAJaWd0X3BsYW5lX3NldF9m
YihwbGFuZSwgJmQtPmZiWzBdKTsKCk5vIHdheSB0aGF0IENJIGNhbiB0ZXN0IHRoaXMgY3VycmVu
dGx5LiBzbyBwdXNoZWQuIDopCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
