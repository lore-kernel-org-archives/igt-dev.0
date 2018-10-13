Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5856E075
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Oct 2018 12:04:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p89-v6so13562602ljb.3
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Oct 2018 05:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <1539357826-22787-1-git-send-email-sunpeng.li@amd.com>
In-Reply-To: <1539357826-22787-1-git-send-email-sunpeng.li@amd.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 13 Oct 2018 13:04:08 +0100
Message-ID: <CAPj87rN4VZEMC8jc8QYXqU+0isXh0UTb_xGgtE3QTG6But+qRQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib: Don't call
 igt_require_fb_modifiers() when no modifier
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
To: sunpeng.li@amd.com
Cc: igt-dev@lists.freedesktop.org, drawat@vmware.com, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgRGVlcGFrLAoKT24gRnJpLCAxMiBPY3QgMjAxOCBhdCAxNjoyNCwgPHN1bnBlbmcubGlAYW1k
LmNvbT4gd3JvdGU6Cj4gKiBJbiBjcmVhdGVfZmIoKSBjYWxscyB0byBrbXNfYWRkZmIoKSwgcmVt
b3ZlIHRoZSBtb2RpZmllciBmbGFnIGlmZiB0aGUKPiAgIGRyaXZlciBkb2Vzbid0IHN1cHBvcnQg
bW9kaWZpZXJzIGFuZCB0aGUgbW9kaWZlciBpcyAwCgpJIGtub3cgdGhpcyB3YXNuJ3QgeW91ciBp
ZGVhIGFuZCB5b3Ugd2VyZSBqdXN0IGZvbGxvd2luZyB0aGUKc3VnZ2VzdGlvbiAtIGJ1dCAwIF9p
c18gYSB2YWxpZCBtb2RpZmllciB3aXRoIGEgdmVyeSBzcGVjaWZpYyBtZWFuaW5nLAp3aGljaCBp
cyB0byBhbHdheXMgaW50ZXJwcmV0IHRoZSBidWZmZXIgYXMgbGluZWFyLCBubyBtYXR0ZXIgd2hh
dC4KCkRSTV9GT1JNQVRfTU9EX0lOVkFMSUQgaXMgYSBub24temVybyB2YWx1ZSwgYW5kIHNob3Vs
ZCBiZSBwYXNzZWQKYW55d2hlcmUgdGhhdCBtb2RpZmllcnMgYXJlIG5vdCBzdXBwb3J0ZWQgb3Ig
dGhlaXIgdXNlIGlzIG5vdCB3YW50ZWQuCgo+IEBAIC0xNjc4LDcgKzE2ODIsOCBAQCBpbnQgX19r
bXNfYWRkZmIoaW50IGZkLCB1aW50MzJfdCBoYW5kbGUsCj4gICAgICAgICBzdHJ1Y3QgZHJtX21v
ZGVfZmJfY21kMiBmOwo+ICAgICAgICAgaW50IHJldCwgaTsKPgo+IC0gICAgICAgaWd0X3JlcXVp
cmVfZmJfbW9kaWZpZXJzKGZkKTsKPiArICAgICAgIGlmIChtb2RpZmllciB8fCBmbGFncyAmIERS
TV9NT0RFX0ZCX01PRElGSUVSUykKClNvIEkgd291bGQgc3VnZ2VzdCBjaGFuZ2luZyB0aGlzIHRl
c3QgdG8gbW9kaWZpZXIgIT0KRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRCwgYW5kIHBhc3NpbmcgSU5W
QUxJRCByYXRoZXIgdGhhbiAwIHdoZXJlCnJlcXVpcmVkLgoKQ2hlZXJzLApEYW5pZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
