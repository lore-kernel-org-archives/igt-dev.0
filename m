Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1223D6E488
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 23:17:40 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190211230811.24955-4-andi.shyti@intel.com>
References: <20190211230811.24955-1-andi.shyti@intel.com>
 <20190211230811.24955-4-andi.shyti@intel.com>
Message-ID: <154992700262.14378.14094133033784538677@skylake-alporthouse-com>
Date: Mon, 11 Feb 2019 23:16:42 +0000
Subject: Re: [igt-dev] [RFC PATCH v7 3/5] lib: ioctl_wrappers: check
 GET/SETPARAM ioctl and build active engine list
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAyLTExIDIzOjA4OjA5KQo+IFRoZSBpZ3RfcmVxdWly
ZV9nZW1fZW5naW5lX2xpc3QoKSBpcyBjYWxsZWQgd2hlbmV2ZXIgdGhlIHRlc3QKPiB3YW50cyB0
byB1c2UgdGhlIEdFVC9TRVRQQVJBTSBpb2N0bHMuCj4gCj4gVGhlIGZ1bmN0aW9uIGNoZWNrcyB3
aGV0aGVyIHRoZSBHRVQvU0VUUEFSQU0gYXJlIGltcGxlbWVudGVkIGluCj4gdGhlIHJ1bm5pbmcg
a2VybmVsIGFuZCBzdG9wcyB0aGUgdGVzdCBpbiBjYXNlIHRoZXNlIGNvbW1hbmRzIGFyZQo+IG5v
dCBzdXBwb3J0ZWQuCj4gCj4gQXQgdGhlIGZpcnN0IGNhbGwgaXQgY3JlYXRlcyB0aGUgY3VycmVu
dCBlbmdpbmUgbGlzdCBhcwo+IGltcGxlbWVudGVkIGluIHRoZSBnZW1faW5pdF9lbmdpbmVfbGlz
dCgpIGZ1bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlA
aW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaW9jdGxfd3JhcHBlcnMuYyB8IDcgKysrKysrKwo+ICBs
aWIvaW9jdGxfd3JhcHBlcnMuaCB8IDEgKwoKTm8gbmV3IGFkZGl0aW9ucyB0byBpb2N0bF93cmFw
cGVycy5jIHBsZWFzZS4gSWYgd2UgYXJlIGdlbmVyYWxpc2luZyBhbgpleGlzdGluZyBpbnRlcmZh
Y2UsIHB1bGwgaXQgb3V0IGludG8gaTkxNS8gYW5kIGFkZCB5b3VyIGFkZGl0aW9ucyB0aGVyZS4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
