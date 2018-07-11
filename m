Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
 <20180709132004.14468-4-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <b04fe86f-cc72-8ce6-7d84-4da94db2c22c@Intel.com>
Date: Wed, 11 Jul 2018 10:52:39 -0700
MIME-Version: 1.0
In-Reply-To: <20180709132004.14468-4-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 03/11] trace.pl: Scale timeline for
 better precision
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gNy85LzIwMTggNjoxOSBBTSwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4gRnJvbTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPgo+IHZpcyBsaWJyYXJ5IGhhcyBh
IGxpbWl0ZWQgcHJlY2lzaW9uIGNvbXBhcmVkIHRvIG91ciB0cmFjZSBkYXRhIHdoaWNoCj4gcHJl
dmVudHMgem9vbWluZyBpbnRvIHRoZSB0aW1lbGluZSBhbmQgc2VlaW5nIHRoZSBmaW5lIGRldGFp
bC4KPgo+IFNjYWxlIHRoZSBIVE1MIHZpZXcgYnkgYSB0aG91c2FuZCB0byB3b3JrIGFyb3VuZCBp
dC4KPgo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRl
bC5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50
ZWwuY29tPgo+IENjOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwuY29tPgo+
IC0tLQoKTWF5YmUgYWRkIGEgY29tbWVudCB0byB0aGUgSFRNTCBwYWdlJ3MgZGVzY3JpcHRpb24g
dGV4dCB3aGVuIHNjYWxpbmcgaXMgCmVuYWJsZWQgdG8gc2F5IHRoYXQgdGhlIHRpbWVsaW5lIHVu
aXRzIGFyZSBub3QgZW50aXJlbHkgYWNjdXJhdGU/IApBbHRob3VnaCwgSSBndWVzcyB0aGUgZGF0
ZSB3YXMgbmV2ZXIgYWN0dWFsbHkgY29ycmVjdCBpbiB0aGUgZmlyc3QgCnBsYWNlISBFaXRoZXIg
d2F5Li4uCgpSZXZpZXdlZC1ieTogSm9obiBIYXJyaXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVs
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
