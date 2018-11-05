Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06256E17F
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Nov 2018 11:24:40 +0000 (UTC)
References: <1541244532-3421-1-git-send-email-juhapekka.heikkila@gmail.com>
 <8f6846fa-a61d-8a8d-9d51-05d6e78407a5@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <7ca65f30-2b78-fb69-065e-da47ae9fc4b6@gmail.com>
Date: Mon, 5 Nov 2018 13:24:35 +0200
MIME-Version: 1.0
In-Reply-To: <8f6846fa-a61d-8a8d-9d51-05d6e78407a5@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: Fix
 handling of unknown single plane modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDUuMTEuMjAxOCAxMTo1NCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6Cj4gT3AgMDMtMTEt
MTggb20gMTI6Mjggc2NocmVlZiBKdWhhLVBla2thIEhlaWtraWxhOgo+PiBGaXggY3JlYXRpb24g
b2YgZ2VtIGJ1ZmZlciBzbyB0aGF0IHVzZWQgYnBwIHdpbGwgYWx3YXlzIGhhdmUgdmFsdWUgb3Ro
ZXIKPj4gdGhhbiAwLgo+Pgo+PiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTA2NzAxCj4+IFNpZ25lZC1vZmYtYnk6IEp1aGEtUGVra2EgSGVp
a2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgIHRlc3RzL2tt
c19hdmFpbGFibGVfbW9kZXNfY3JjLmMgfCAxMCArKysrKy0tLS0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19hdmFpbGFibGVfbW9kZXNfY3JjLmMgYi90ZXN0cy9rbXNfYXZhaWxhYmxlX21vZGVz
X2NyYy5jCj4+IGluZGV4IDQ1YTQ3NzUuLjAwNmMyZGIgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL2tt
c19hdmFpbGFibGVfbW9kZXNfY3JjLmMKPj4gKysrIGIvdGVzdHMva21zX2F2YWlsYWJsZV9tb2Rl
c19jcmMuYwo+PiBAQCAtMTY0LDcgKzE2NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgewo+PiAg
ICNpZmRlZiBEUk1fRk9STUFUX1AwMTYKPj4gICAJeyBEUk1fRk9STUFUX1AwMTYsIDAsIFAwMTAs
IDB4ODAwMGViMDB9LAo+PiAgICNlbmRpZgo+PiAtCXsgMCwgMCwgMCwgMCB9Cj4+ICsJeyAwLCAw
LCBTS0lQNCwgMCB9Cj4gUmVtb3ZlIHRoaXMgZW50cnksIGFuZCBtYWtlIHRoZSBsb29wCj4gZm9y
IChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZmlsbGVycyk7IGkrKykgeyB9Cj4gCj4gaWYgKGkgPT0g
QVJSQVlfU0laRShmaWxsZXJzKSkKPiByZXR1cm4gZmFsc2U7Cj4gCj4gPwo+IAo+IFRoaXMgc2hv
dWxkIHByZXZlbnQgaXQgZnJvbSBldmVyIGJlaW5nIGEgcHJvYmxlbSBpbiB0aGUgZmlyc3QgcGxh
Y2UuCj4gCgpJIHdhcyB0aGlua2luZyB0aGlzIGF0IGZpcnN0IHRvbyBidXQgdGhhdCAnc2tpcDQn
IGZsYWcgaXMgdXNlZCB0byBza2lwIApDUkMgY2hlY2tpbmcgYXQgbGF0ZXIgdGltZS4gVGhpcyB0
ZXN0IHJ1bnMgaW4gdHdvIGxldmVscywgYXQgZmlyc3QgdHJ5IAp0byBlbmFibGUgcGxhbmUgZm9y
bWF0IGFuZCB0aGVuIGRvIENSQy4gVGhpcyBsYXN0IGVsZW1lbnQgaXMgZm9yIHRoZSAKY2FzZSB3
aGVyZSBwbGFuZSBmb3JtYXQgd2FzIG5vdCBoYXJkY29kZWQgaGVyZS4KCkkgZGlkIGhhdmUgYW5v
dGhlciBsb29rIGF0IHRoaXMgdGVzdCBhbmQgbWFkZSBhbm90aGVyIHBhdGNoIHdoaWNoIGFsc28g
CnJlbGF4IENSQyBjaGVja2luZyBzbyB0aGlzIHRlc3Qgd2lsbCBwYXNzIG9uIG91ciBtb2Rlcm4g
SFcsIEkgZ290IGlkZWEgCmZyb20gVmlsbGUncyB1c2FnZSBvZiBnYW1tYSBvbiBrbXNfcGxhbmUu
IEknbGwgcHV0IGl0IG9uIHRoZSBsaXN0IGluIGEgCm1pbnV0ZS4KCi9KdWhhLVBla2thCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
