Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7084989221
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 22:26:53 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h28so3091878qkk.7
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 14:26:53 -0800 (PST)
Message-ID: <e1d3444199b275b403841bb67560014fefa5ebd5.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
Date: Wed, 20 Feb 2019 17:26:50 -0500
In-Reply-To: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
References: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/9] tests/kms_lease: Add invalid planes
 tests
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Keith Packard <keithp@keithp.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWxyaWdodC1taW51cyB0aGUgZmV3IGNvbW1lbnRzIEkgbGVmdCwgdGhpcyBsb29rcyBnb29kIHRv
IG1lLiBXaXRoIHRob3NlCmNoYW5nZXM6CgpSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KCk9uIFdlZCwgMjAxOS0wMi0yMCBhdCAxNzoyNSArMDEwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiBUZXN0IGdhcCBiZWNhdXNlIHdlJ3JlIHVzaW5nIHVuaXZlcnNhbCBwbGFu
ZXMgYnkgZGVmYXVsdC4gRml4IHRoYXQuCj4gCj4gQ2M6IEtlaXRoIFBhY2thcmQgPGtlaXRocEBr
ZWl0aHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+Cj4gLS0tCj4gIHRlc3RzL2ttc19sZWFzZS5jIHwgMTUgKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19sZWFzZS5jIGIvdGVzdHMva21zX2xlYXNlLmMKPiBpbmRleCBjY2E0MjQ1OThlYTcu
LjcwYTk2MzYyZDc3YSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfbGVhc2UuYwo+ICsrKyBiL3Rl
c3RzL2ttc19sZWFzZS5jCj4gQEAgLTU3Myw2ICs1NzMsMjAgQEAgc3RhdGljIHZvaWQgbGVhc2Vf
aW52YWxpZF9jcnRjKGRhdGFfdCAqZGF0YSkKPiAgCWlndF9hc3NlcnRfZXEocmV0LCAtRUlOVkFM
KTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbGVhc2VfaW52YWxpZF9wbGFuZShkYXRhX3QgKmRh
dGEpCj4gK3sKPiArCWxlYXNlX3QgbGVhc2U7Cj4gKwl1aW50MzJfdCBzYXZlX3BsYW5lX2lkOwo+
ICsJaW50IHJldDsKPiArCj4gKwkvKiBDcmVhdGUgYW4gaW52YWxpZCBsZWFzZSAqLwo+ICsJc2F2
ZV9wbGFuZV9pZCA9IGRhdGEtPnBsYW5lX2lkOwo+ICsJZGF0YS0+cGxhbmVfaWQgPSAweGJhYWRm
MDBkOwo+ICsJcmV0ID0gbWFrZV9sZWFzZShkYXRhLCAmbGVhc2UpOwo+ICsJZGF0YS0+cGxhbmVf
aWQgPSBzYXZlX3BsYW5lX2lkOwo+ICsJaWd0X2Fzc2VydF9lcShyZXQsIC1FSU5WQUwpOwo+ICt9
Cj4gKwo+ICAKPiAgc3RhdGljIHZvaWQgcnVuX3Rlc3QoZGF0YV90ICpkYXRhLCB2b2lkICgqdGVz
dGZ1bmMpKGRhdGFfdCAqKSkKPiAgewo+IEBAIC02MjUsNiArNjM5LDcgQEAgaWd0X21haW4KPiAg
CQl7ICJsZWFzZV9hZ2FpbiIsIGxlYXNlX2FnYWluIH0sCj4gIAkJeyAibGVhc2VfaW52YWxpZF9j
b25uZWN0b3IiLCBsZWFzZV9pbnZhbGlkX2Nvbm5lY3RvciB9LAo+ICAJCXsgImxlYXNlX2ludmFs
aWRfY3J0YyIsIGxlYXNlX2ludmFsaWRfY3J0YyB9LAo+ICsJCXsgImxlYXNlX2ludmFsaWRfcGxh
bmUiLCBsZWFzZV9pbnZhbGlkX3BsYW5lIH0sCj4gIAkJeyB9Cj4gIAl9LCAqZjsKPiAgCi0tIApD
aGVlcnMsCglMeXVkZSBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
