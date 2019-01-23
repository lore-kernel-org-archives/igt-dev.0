Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304F86E51F
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 17:38:58 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id j3so1004174uap.3
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 09:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20190123113108.9907-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20190123113108.9907-1-daniel.vetter@ffwll.ch>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 23 Jan 2019 17:35:09 +0000
Message-ID: <CACvgo53WN_0PT1_Xi3MYVj33tJYcv0E9MGZTcneMt88ALouN7g@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/core_auth: Merge getclient
 subtests
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMyBKYW4gMjAxOSBhdCAxMTozMSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBFbWlsIGhhcyBhbm90aGVyIGF1dGggdGVzdCB3aGljaCBj
b3VsZCB1c2UgdGhlIGNoZWNrX2F1dGggZnVuY3Rpb24sIHNvCj4gYmVzdCB0byBtZXJnZSB0aGVt
IGFsbC4KPgo+IFdlIG5lZWQgYSBzdWJ0ZXN0IGdyb3VwIGFuZCBwdXQgdGhlIHRlc3RzIHdoaWNo
IG5lZWQgdG8gZnVsbHkgY29udHJvbAo+IHdobydzIG1hc3RlciBhbmQgaG93IG1hbnkgb3BlbiBk
cm0gZmQgdGhlcmUgYXJlIGZpcnN0Lgo+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlr
b3ZAZ21haWwuY29tPgoKQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20+CgpBY2suIG9uIHRoZSBpZGVhLiBQb2ludGluZyBvdXQgc29tZSBiaXRzIHRoYXQg
c2VlbSBvZmYgYmVsb3cuCkkgd291bGQgX25vdF8gYm90aGVyIHdpdGggYW55IG9mIHRoZW0gaGVy
ZSwgYWx0aG91Z2ggdGhleSBtYXkgYmUgd29ydGgKYWRkcmVzc2luZyBhdCBzb21lIHBvaW50LgoK
PiArICAgICAgIGlndF9zdWJ0ZXN0KCJnZXRjbGllbnQtbWFzdGVyLWRyb3AiKSB7Cj4gKyAgICAg
ICAgICAgICAgIGludCBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfQU5ZKTsKPiArICAgICAg
ICAgICAgICAgaW50IGZkMiA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfQU5ZKTsKPiArCj4gKyAg
ICAgICAgICAgICAgIGlndF9hc3NlcnQoY2hlY2tfYXV0aChmZDIpID09IHRydWUpOwo+ICsKPiAr
ICAgICAgICAgICAgICAgY2xvc2UoZmQpOwo+ICsKPiArICAgICAgICAgICAgICAgaWd0X2Fzc2Vy
dChjaGVja19hdXRoKGZkMikgPT0gdHJ1ZSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBjbG9zZShm
ZDIpOwpFaXRoZXIgYSBjb21tZW50IGlzIG1pc3NpbmcgaGVyZSwgc29tZXRoaW5nIHNlZW1zIHdy
b25nIC4uLiBub3Qgc3VyZS4KIC0gdGVzdCBpcyBjYWxsZWQgIm1hc3Rlci1kcm9wIiwgeWV0IHdl
IGNoZWNrIHRoZSBhdXRoZW50aWNhdGlvbiBiZWluZwoiZHJvcHBlZCIuCiAtIGF1dGhlbnRpY2F0
aW9uIGlzIGFsd2F5cyBzZXQgYmVjYXVzZSB3ZSBydW4gYXMgcm9vdAogLSB0d28gY2xpZW50cyBh
cmUgcHJlc2VudCwgeWV0IHdlIG9ubHkgZXZlciBjaGVjayBvbmUgb2YgdGhlbQogLSB0aGVyZSBp
cyBubyBtZWFucyB0byBkcm9wIGF1dGhlbnRpY2F0aW9uIGZvciBhIGdpdmVuIGNsaWVudCAtIGJl
CnRoYXQgdXNlcnNwYWNlIG9yIGluLWtlcm5lbCBBUEkKCkhUSApFbWlsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
