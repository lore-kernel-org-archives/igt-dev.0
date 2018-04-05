Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB676E6D0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 08:44:51 +0000 (UTC)
Received: by mail-it0-x231.google.com with SMTP id u62-v6so2530259ita.5
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Apr 2018 01:44:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
References: <20180330154939.20647-1-daniels@collabora.com>
 <95cd7da4-fbba-9ac3-404c-3a0eb69c3a35@intel.com>
 <CAPj87rNAHOJNvhyO=BAUCvVYV5XrHJrU7v3Wv45FXNfu4qQX9Q@mail.gmail.com>
 <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Apr 2018 10:44:49 +0200
Message-ID: <CAKMK7uF+mQ_E7GL3KMO8MdH2qT5fBBad=rF+cR1TJVj4y0Kc7Q@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_getfb: Use fixtures and
 subtest groups
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Stone <daniels@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBcHIgMiwgMjAxOCBhdCA3OjEzIFBNLCBBbnRvbmlvIEFyZ2Vuemlhbm8KPGFudG9u
aW8uYXJnZW56aWFub0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4KPiBPbiAwMi8wNC8xOCAwNjowMiwg
RGFuaWVsIFN0b25lIHdyb3RlOgo+Pgo+PiBIaSBBbnRvbmlvLAo+Pgo+PiBPbiAzMCBNYXJjaCAy
MDE4IGF0IDIyOjAxLCBBbnRvbmlvIEFyZ2Vuemlhbm8KPj4gPGFudG9uaW8uYXJnZW56aWFub0Bp
bnRlbC5jb20+IHdyb3RlOgo+Pj4KPj4+IFNpbmNlIGJvdGggdGVzdF9oYW5kbGVfaW5wdXQgYW5k
IHRlc3RfZHVwbGljYXRlX2hhbmRsZXMgZGVmaW5lIHNvbWUKPj4+IHN1Yi10ZXN0cyBhbmQgc29t
ZSBmaXh0dXJlcywgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdW53cmFwIHRob3NlCj4+
PiBmdW5jdGlvbnMgYW5kIGRvIGFsbCBmaXh0dXJlcyBhbmQgc3VidGVzdCBkZWZpbml0aW9uIGlu
IGlndF9tYWluIHRvIG1ha2UKPj4+IGl0Cj4+PiBtb3JlIHJlYWRhYmxlLiBJdCBzZWVtcyBsaWtl
IHlvdSB3b3VsZCBhbHNvIGJlIGFibGUgdG8gcmV1c2UgdGhlIHNhbWUKPj4+IGZpeHR1cmUgYWNy
b3NzIHRoZSB0d28gc3VidGVzdF9ncm91cHMuCj4+Cj4+Cj4+IFRvIGJlIGNsZWFyLCBkb2VzIHRo
aXMgbWVhbiB0aGF0IGVhY2ggcGllY2Ugb2YgZml4dHVyZSBhbmQgaWd0X3N1YnRlc3QKPj4gZGVm
aW5pdGlvbiBzaG91bGQgbGl2ZSBpbnNpZGUgbWFpbj8KPgo+Cj4gSSBkb24ndCB0aGluayB0aGVy
ZSBpcyBhIHJ1bGUgZm9yIHRoYXQsIGl0IGxvb2tzIGJldHRlciB0aGF0IHdheQo+IChmaXh0dXJl
cy9pZ3Rfc3VidGVzdC9zdWJ0ZXN0X2dyb3VwIGFsbCBpbiB0aGUgbWFpbikgSU1PIDopLiBBbHNv
IGl0IGlzIHdoYXQKPiBJJ3ZlIGZvdW5kIGluIG1vc3QgaWYgbm90IGFsbCB0ZXN0cyBJJ3ZlIGxv
b2tlZCBhdC4KPgo+IFN0aWxsIHRoZSBwYXRjaCBtYWtlcyBzZW5zZSB3aXRoIG9yIHdpdGhvdXQg
bXkgc3VnZ2VzdGlvbi4KPiBBY2tlZC1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFy
Z2Vuemlhbm9AaW50ZWwuY29tPgoKaWd0X3N1YnRlc3QgYW5kIGlndF9maXh0dXJlIGluIGZ1bmN0
aW9ucywgdG8gZ3JvdXAgc3R1ZmYsIGFuZCB0aGVuCmhhdmluZyBhbiBvdmVyYWxsIGlndF9zdWJ0
ZXN0X2dyb3VwIHNlZW1zIGEgcGVyZmVjdGx5IGZpbmUgcGF0dGVybiB0bwptZS4gRXNwZWNpYWxs
eSB3aXRoIHNpbXBsZSB0ZXN0cyB0aGF0IGp1c3QgY2hlY2sgdG9ucyBvZiB1YXBpCmNvbWJpbmF0
aW9ucyBmb3IgaW5wdXQgdmFsaWRhdGlvbiBvbiB0aGUga2VybmVsIHNpZGUgaWd0X21haW4Kb3Ro
ZXJ3aXNlIGdldHMgZXh0ZXJtZWx5IHVud2llbGR5LgoKSSB0aGluayB0aGlzIGhlcmUgaXMgcGVy
ZmVjdGx5IGZpbmUgYXMtaXMuCgpDaGVlcnMsIERhbmllbAoKPgo+IFRoYW5rcywKPiBBbnRvbmlv
Cj4KPgo+Pgo+PiBDaGVlcnMsCj4+IERhbmllbAo+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
