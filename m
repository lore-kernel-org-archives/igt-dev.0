Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC96E176
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Apr 2018 17:52:47 +0000 (UTC)
Message-ID: <1523038623.11823.4.camel@dk-H97M-D3H>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Fri, 06 Apr 2018 11:17:03 -0700
In-Reply-To: <20180405104954.6880-1-maarten.lankhorst@linux.intel.com>
References: <20180405104954.6880-1-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Add timeouts to
 opening pipe CRC fd.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgoKT24gVGh1LCAyMDE4LTA0LTA1IGF0IDEyOjQ5ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3
cm90ZToKPiBUaGlzIHdpbGwgZml4IHRoZSBQU1IgdGVzdHMgdG8gZmFpbCBzbGlnaHRseSBmYXN0
ZXIsIHNpbmNlIHRoZXkgd2FpdAo+IGluZGVmaW5pdGVseSBmb3IgYSBDUkMgdGhhdCBuZXZlciBj
b21lcyBkdXJpbmcgb3Blbi4KPiAKCldoaWxlIHdlIG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8g
cnVuIHRoZXNlIHRlc3RzIHdpdGhvdXQgQ1JDLCB0aW1pbmcKb3V0IHRoZSB0ZXN0cyBtYWtlcyBz
ZW5zZS4KClJldmlld2VkLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRp
eWFuQGludGVsLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0
ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9kZWJ1Z2ZzLmMg
fCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfZGVidWdmcy5jIGIvbGliL2lndF9kZWJ1Z2ZzLmMKPiBpbmRleCA4YWRjMDJl
OWNjNDcuLjA5NGRmNTY0YjZmNCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2RlYnVnZnMuYwo+ICsr
KyBiL2xpYi9pZ3RfZGVidWdmcy5jCj4gQEAgLTc1Nyw3ICs3NTcsMTAgQEAgdm9pZCBpZ3RfcGlw
ZV9jcmNfc3RhcnQoaWd0X3BpcGVfY3JjX3QgKnBpcGVfY3JjKQo+ICAKPiAgCXNwcmludGYoYnVm
LCAiY3J0Yy0lZC9jcmMvZGF0YSIsIHBpcGVfY3JjLT5waXBlKTsKPiAgCj4gKwlpZ3Rfc2V0X3Rp
bWVvdXQoNSwgIk9wZW5pbmcgY3JjIGZkLCB3aGljaCB3YWl0cyBmb3IgZmlyc3QgQ1JDLiIpOwo+
ICAJcGlwZV9jcmMtPmNyY19mZCA9IG9wZW5hdChwaXBlX2NyYy0+ZGlyLCBidWYsIHBpcGVfY3Jj
LT5mbGFncyk7Cj4gKwlpZ3RfcmVzZXRfdGltZW91dCgpOwo+ICsKPiAgCWlndF9hc3NlcnQocGlw
ZV9jcmMtPmNyY19mZCAhPSAtMSk7Cj4gIAllcnJubyA9IDA7Cj4gIH0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
