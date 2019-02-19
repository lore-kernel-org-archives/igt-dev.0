Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46D89269
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Feb 2019 14:23:36 +0000 (UTC)
Date: Tue, 19 Feb 2019 16:23:32 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190219142332.dgf5lajneohb7ed6@ahiler-desk1.fi.intel.com>
References: <20190219132543.31786-1-arkadiusz.hiler@intel.com>
 <20190219132543.31786-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190219132543.31786-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests: Prefix pm_ tests with i915_
 and move them to i915/
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDM6MjU6NDNQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IFRoZXkgYXJlIGk5MTUtc3BlY2lmaWMsIHNvIHRoZXkgYmVsb25nIHRvIHRoZSBk
aXJlY3RvcnkuCj4gVGhlIChub3cpIGluZml4IF9wbV8gaXMgcXVpdGUgaW5mb3JtYXRpdmUgYW5k
IHdvcnRoIGtlZXBpbmcuCj4gCj4gdjI6IGFsc28gcHJlZml4IC5jIGZpbGVzCj4gCj4gQ2M6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBFd2VsaW5hIE11c2lh
bCA8ZXdlbGluYS5tdXNpYWxAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBI
aWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KPiAtLS0KPiBBY2tzL3JicyBhcHByZWNp
YXRlZCwgYnV0IHBsZWFzZSBsZXQgbWUgcHVzaCBpdCwgYXMgSSBoYXZlIHRvIGRvCj4gcmVuYW1p
bmcgaW4gdGhlIGNpYnVnbG9nIGZpcnN0IDotKQoKSSBmb3Jnb3QgdG8gc3RhZ2UgdGhpcyBjaGFu
Z2U6CgpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCBiL3Rlc3RzL2lu
dGVsLWNpL2JsYWNrbGlzdC50eHQKaW5kZXggZjlhZDQ3ZWEuLmYzNDQwZjMxIDEwMDY0NAotLS0g
YS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0CisrKyBiL3Rlc3RzL2ludGVsLWNpL2JsYWNr
bGlzdC50eHQKQEAgLTEzLDcgKzEzLDcgQEAgaWd0QGRybV9tbShALiopPwogIyBmYWlsdXJlcyBp
biB0ZXN0cyBydW4gYWZ0ZXJ3YXJkcy4KICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiBpZ3RAaTkxNV9tb2R1bGVfbG9hZChALiopPwotaWd0QHBtX3JwbUBt
b2R1bGUtcmVsb2FkCitpZ3RAaTkxNV9wbV9ycG1AbW9kdWxlLXJlbG9hZAogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICMgR0VNCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
