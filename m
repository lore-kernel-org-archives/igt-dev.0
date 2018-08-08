Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB8289518
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Aug 2018 11:28:16 +0000 (UTC)
Date: Wed, 8 Aug 2018 14:28:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180808112814.sqza4ztkge4abj4n@platvala-desk.ger.corp.intel.com>
References: <20180808110701.12619-1-petri.latvala@intel.com>
 <20180808110701.12619-2-petri.latvala@intel.com>
 <153372706824.16501.3196602104056269657@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153372706824.16501.3196602104056269657@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib: Print subtest starting/ending
 line to stderr too
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDgsIDIwMTggYXQgMTI6MTc6NDhQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgUGV0cmkgTGF0dmFsYSAoMjAxOC0wOC0wOCAxMjowNjo1NykKPiA+IHdo
ZW4gaW5zdHJ1Y3RlZCB2aWEgdGhlIGVudmlyb25tZW50LiBUaGlzIGlzIG5lZWRlZCBmb3IgdGhl
IG5ldyB0ZXN0Cj4gPiBydW5uZXIgdG8gcHJvcGVybHkgYXNzaWduIHN0ZGVyciBvdXRwdXQgdG8g
dGhlIGNvcnJlY3Qgc3VidGVzdC4KPiAKPiBNeSBhc3N1bXB0aW9uIHdhcyB0aGF0IHRoaXMgd291
bGQgYWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgaWd0Cj4gZnJhbWV3b3JrLCBzbyB0aGlzIGlu
Zm9ybWF0aW9uIHdvdWxkIGJlIHByb3ZpZGVkIGJ5IHRoZSBydW5uZXIgdG8gaWd0IGFzCj4gcGFy
dCBvZiBpdHMgcHJvdG9jb2wgLS0gSSB3YXMgZXhwZWN0aW5nIG11Y2ggbW9yZSBkaXJlY3RuZXNz
IGFuZCB0aGF0Cj4gd2hlbiB3ZSBydW4gdGhlIHRlc3RzIHdlIGdldCB0aGUgc2FtZSByZXN1bHRz
IGFzIGlmIHJ1biBpbmRpcmVjdGx5IChrbXNnCj4gY2FwdHVyaW5nLCB3YXJuIGRpYWdub3Npbmcs
IC9kZXYvd2F0Y2hkb2cgaW50ZWdyYXRpb24sIGV0YykKCgpZb3UgY2FuIGNvbnNpZGVyIHRoaXMg
YSB0ZW1wb3JhcnkgaW1wbGVtZW50YXRpb24gZGV0YWlsLiBJJ20gdGhpbmtpbmcKb2YgbWFraW5n
IHRoZSB0ZXN0cyBwcmludCB0aGVpciBsb2dzIHZpYSBhIHNpbmdsZSBmZCBpZiB0aGUgcnVubmVy
IGlzCmV4ZWN1dGluZyB0aGVtLCBtYWtpbmcgYWxsIHRoYXQgc2VudGluZWwgYnVzaW5lc3MgdW5u
ZWNlc3NhcnkuCgpIYXZpbmcgdGhlIHJ1bm5lciBjb25zb2xpZGF0ZSB0aGUgbG9ncyBhbmQgaGFu
ZGxlIHRoZSBsb2cgYnVmZmVyaW5nCndvdWxkIGFsc28gbWFrZSBpdCBwb3NzaWJsZSB0byBncmFi
IHRoZSBkZWJ1ZyBwcmludHMgZnJvbQppbmNvbXBsZXRlcy4uLgoKCgotLSAKUGV0cmkgTGF0dmFs
YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
