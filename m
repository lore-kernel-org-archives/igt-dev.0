Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31B76E2D4
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 16:39:14 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181204162526.26687-1-lukasz.kalamarz@intel.com>
References: <20181204162526.26687-1-lukasz.kalamarz@intel.com>
Message-ID: <154394153643.11526.9372725154867434775@skylake-alporthouse-com>
Date: Tue, 04 Dec 2018 16:39:01 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/3] lib/ioctl_wrapper: Add
 i915_get_param helper
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <Petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWthc3ogS2FsYW1hcnogKDIwMTgtMTItMDQgMTY6MjU6MjQpCj4gZ2V0cGFyYW0g
aXMgdXNlZCBpbiBmZXcgcGxhY2VzIGFjcm9zcyBJR1QsIGJ1dCBubyBoZWxwZXIgZnVuY3Rpb24K
PiBpcyB1c2VkIHRvIHJlZHVjZSBjb2RlIGR1cGxpY2F0aW9uLgo+IAo+IHYyOiBBZGRlZCBkb2Mg
cGFydCBhbmQgY2hhbmdlZCByZXR1cm4gdmFsdWUgaW4gY2FzZSBvZiBlcnJvcgo+IHYzOiBSZW5h
bWVkIGZ1bmN0aW9uIHRvIGk5MTVfZ2V0X3BhcmFtLCBjcmVhdGVkIGludGVybmFsIGVycm9yCj4g
Y2hlY2tpbmcgZnVuY3Rpb24gYW5kIGhlbHBlciBmdW5jdGlvbiB0byBjaGVjayBpZiBnaXZlbiBm
ZWF0dXJlCj4gaXMgZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogS2FsYW1hcnog
PGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+Cj4gCj4gQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1p
Y2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgo+IENjOiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEu
ZGVjQGludGVsLmNvbT4KPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJh
b2xvc3B1cmlvQGludGVsLmNvbT4KPiBDYzogUGV0cmkgTGF0dmFsYSA8UGV0cmkubGF0dmFsYUBp
bnRlbC5jb20+Cj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6IEFudG9u
aW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KPiBDYzogQW5raXQg
SyBOYXV0aXlhbCA8YW5raXQuay5uYXV0aXlhbEBpbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pb2N0
bF93cmFwcGVycy5jIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiAgbGliL2lvY3RsX3dyYXBwZXJzLmggfCAgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDUyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lvY3RsX3dyYXBwZXJzLmMg
Yi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+IGluZGV4IDlmMjU1NTA4Li5iNDhkYWQ1YiAxMDA2NDQK
PiAtLS0gYS9saWIvaW9jdGxfd3JhcHBlcnMuYwo+ICsrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5j
CgpPdXQgb2YgdGhlIGZyZWVkb20gb2YgbGliL2k5MTUvKiwgeW91IGNob3NlIGxpYi9pb2N0bF93
cmFwcGVycy5jIGZvciB0aGlzCmk5MTUgc3BlY2lmaWMgaW50ZXJmYWNlPwotQ2hyaXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
