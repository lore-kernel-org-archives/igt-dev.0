Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D8A892C2
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 11:20:52 +0000 (UTC)
Date: Wed, 20 Feb 2019 13:20:48 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190220112048.czddxobuc6gsuqgb@ahiler-desk1.fi.intel.com>
References: <20190219132543.31786-1-arkadiusz.hiler@intel.com>
 <20190219132543.31786-3-arkadiusz.hiler@intel.com>
 <87mumqu67b.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mumqu67b.fsf@intel.com>
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMTI6MDQ6MDhQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gVHVlLCAxOSBGZWIgMjAxOSwgQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGls
ZXJAaW50ZWwuY29tPiB3cm90ZToKPiA+IFRoZXkgYXJlIGk5MTUtc3BlY2lmaWMsIHNvIHRoZXkg
YmVsb25nIHRvIHRoZSBkaXJlY3RvcnkuCj4gPiBUaGUgKG5vdykgaW5maXggX3BtXyBpcyBxdWl0
ZSBpbmZvcm1hdGl2ZSBhbmQgd29ydGgga2VlcGluZy4KPiAKPiBUb28gbGF0ZSB0byB0aGUgcGFy
dHkgYW5kIEknbSBzdXJlIEknbSBtaXNzaW5nIHNvbWV0aGluZy4gQnV0Li4uCj4gCj4gSXQgZG9l
cyBmZWVsIGxpa2UgbW92aW5nIHRoaW5ncyBpbiBpOTE1IGRpcmVjdG9yeSAqYW5kKiBwcmVmaXhp
bmcgd2l0aAo+IGk5MTUgaXMgYW4gdW5uZWNlc3NhcnkgdGF1dG9sb2d5LiBXaHkgbm90IGp1c3Qg
b25lIG9yIHRoZSBvdGhlcj8KCkkgYW0gbm90IGEgZmFuIG9mIHRoaXMgcmVkdW5kYW5jeSBlaXRo
ZXIsIGJ1dCBpdCBtYWtlcyBzZW5zZSB3aXRoIHNvbWUKY29udGV4dC4gTGV0IG1lIGV4cGxhaW46
CgogKiBpOTE1LyBzbyB0aGF0IGBsc2Agb3VwdXQgIGlzIG1vcmUgZGlnZXN0aWJsZS4gV2UgYWxz
byBoYXZlIGdlbV8gYW5kCiAgIGdlbjNfIHRlc3RzIHRoZXJlIHRoYXQgYXJlIG5vdCBpOTE1XyBw
cmVmaXhlZC4KCiAqIGk5MTVfIHNvIHRoYXQgYmluYXJ5IG5hbWUgY29ycmVzcG9uZHMgdG8gLmMg
ZmlsZSwgbWFrZXMgdGVzdCBsb29rdXAKICAgZWFzaWVyLgoKT2YgYWxsIHRoZSBjb25zaWRlcmVk
IG9wdGlvbnMgdGhpcyBzZWVtIHRvIG1ha2UgdGhlIG1vc3QgcGVvcGxlIGhhcHB5LgoKLS0gCkNo
ZWVycywKQXJlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
