Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4A56E397
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Oct 2018 20:09:49 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed, 31 Oct 2018 13:09:42 -0700
Message-ID: <7336033.6ZThZENcyH@dk-thinkpad-x260>
In-Reply-To: <20181019125001.27789-1-maarten.lankhorst@linux.intel.com>
References: <20181019125001.27789-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Really
 do not skip on 4k displays.
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpZGF5LCBPY3RvYmVyIDE5LCAyMDE4IDU6NTA6MDEgQU0gUERUIE1hYXJ0ZW4gTGFua2hv
cnN0IHdyb3RlOgoKVGhlIHRlc3Qgc2V0cyBET05UX0FTU0VSVF9GRUFUVVJFX1NUQVRVUywgd2h5
IGRvZXMgaXQgc2tpcD8KCj4gVGhlIHByZXZpb3VzIGZpeGVzIHRvIGttc19mcm9udGJ1ZmZlcl90
cmFja2luZyBmaXhlZCB0aGUgc2hhcmVkZmIgdGVzdHMsCj4gYnV0IHRoZSBzdHJpZGVjaGFuZ2Ug
dGVzdCBzdGlsbCBjcmVhdGVzIGl0cyBvd24gZmIuIFVzZSBhIHNtYWxsZXIgZmIgaW4KUGxlYXNl
IHByb3ZpZGUgc29tZSBjb250ZXh0IHRvIHdoYXQgdGhlIG1heCBhbGxvd2VkIHN0cmlkZSBpcy4K
Cj4gb3JkZXIgdG8gdGVzdCBhIHN0cmlkZSBjaGFuZ2UsIHdpdGhvdXQgZW5kaW5nIHVwIHdpdGgg
YW4gZXhjZXNzaXZlIHN0cmlkZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9rbXNf
ZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1
ZmZlcl90cmFja2luZy5jIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPiBpbmRl
eCBiZjRhNjhmZjJiZGUuLmE0ZjBkOWY3MmFhYiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmcuYwo+ICsrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2lu
Zy5jCj4gQEAgLTI5MjMsNyArMjkyMyw3IEBAIHN0YXRpYyB2b2lkIHN0cmlkZWNoYW5nZV9zdWJ0
ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQpCj4gIAo+ICAJb2xkX2ZiID0gcGFyYW1zLT5w
cmltYXJ5LmZiOwo+ICAKPiAtCWNyZWF0ZV9mYih0LT5mb3JtYXQsIHBhcmFtcy0+cHJpbWFyeS5m
Yi0+d2lkdGggKyA1MTIsIHBhcmFtcy0+cHJpbWFyeS5mYi0+aGVpZ2h0LAo+ICsJY3JlYXRlX2Zi
KHQtPmZvcm1hdCwgcGFyYW1zLT5wcmltYXJ5LmZiLT53aWR0aCArIDY0LCBwYXJhbXMtPnByaW1h
cnkuZmItPmhlaWdodCwKCkkgdGhpbmsgd2UgY2FuIG1ha2UgdGhpcyBhIGJpdCBtb3JlIGdlbmVy
aWMuIEhvdyBhYm91dCBkZWZpbmluZyB0aGUgbWluIG9mIHRoZSBtYXggc3RyaWRlIHRoYXQgZmJj
CnRvbGVyYXRlcyBhY3Jvc3MgYWxsIHBsYXRmb3JtcyBhbmQgdXNpbmcgdGhhdD8gCgotREsKCj4g
IAkJICBvcHQudGlsaW5nLCB0LT5wbGFuZSwgJm5ld19mYik7Cj4gIAlmaWxsX2ZiKCZuZXdfZmIs
IENPTE9SX1BSSU1fQkcpOwo+ICAKPiAKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
