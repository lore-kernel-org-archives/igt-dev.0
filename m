Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40E288284
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jan 2019 02:26:44 +0000 (UTC)
Message-ID: <7331c050cc269c0ab10ed75ea17c6fe0bf6fb052.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed, 23 Jan 2019 18:26:37 -0800
In-Reply-To: <20190123235636.8720-2-jose.souza@intel.com>
References: <20190123235636.8720-1-jose.souza@intel.com>
 <20190123235636.8720-2-jose.souza@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/4] tests/intel-ci: Add basic PSR2
 tests to fast feedback test list
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
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTAxLTIzIGF0IDE1OjU2IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOgo+IExldHMgcnVuIHRoZSBzYW1lIFBTUjEgYmFzaWMgdGVzdHMgZm9yIFBTUjIgdG8g
Y2F1Z2h0IFBTUjIKPiByZWdyZXNzaW9ucyBmYXN0ZXIuCj4gCj4gQ2M6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4KPiBDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFr
YXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgoKSWYgdGhlc2UgdGVzdHMgcGFzcyBvbiBh
bGwgQ0kgbWFjaGluZXMsClJldmlld2VkLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWth
cmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVk
YmFjay50ZXN0bGlzdCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3Qg
Yi90ZXN0cy9pbnRlbC0KPiBjaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0Cj4gaW5kZXggZGEzYzRj
OGUuLmU0OGNiOGE1IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2su
dGVzdGxpc3QKPiArKysgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0Cj4g
QEAgLTIyNyw2ICsyMjcsMTAgQEAgaWd0QGttc19wc3JAcHJpbWFyeV9wYWdlX2ZsaXAKPiAgaWd0
QGttc19wc3JAY3Vyc29yX3BsYW5lX21vdmUKPiAgaWd0QGttc19wc3JAc3ByaXRlX3BsYW5lX29u
b2ZmCj4gIGlndEBrbXNfcHNyQHByaW1hcnlfbW1hcF9ndHQKPiAraWd0QGttc19wc3JAcHNyMl9w
cmltYXJ5X3BhZ2VfZmxpcAo+ICtpZ3RAa21zX3BzckBwc3IyX2N1cnNvcl9wbGFuZV9tb3ZlCj4g
K2lndEBrbXNfcHNyQHBzcjJfc3ByaXRlX3BsYW5lX29ub2ZmCj4gK2lndEBrbXNfcHNyQHBzcjJf
cHJpbWFyeV9tbWFwX2d0dAo+ICBpZ3RAa21zX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xlLWNy
dGMKPiAgaWd0QHBtX2JhY2tsaWdodEBiYXNpYy1icmlnaHRuZXNzCj4gIGlndEBwbV9ycG1AYmFz
aWMtcGNpLWQzLXN0YXRlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
