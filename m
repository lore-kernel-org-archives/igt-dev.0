Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7EA6E6E9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Aug 2018 11:29:17 +0000 (UTC)
Message-ID: <1533814155.30780.5.camel@intel.com>
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 09 Aug 2018 14:29:15 +0300
In-Reply-To: <153381004511.6849.14423157077521872600@skylake-alporthouse-com>
References: <1533809554-27925-1-git-send-email-mika.kahola@intel.com>
 <1533809554-27925-2-git-send-email-mika.kahola@intel.com>
 <153381004511.6849.14423157077521872600@skylake-alporthouse-com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] tests/kms_flip: Set duration for
 subtest from command line
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: mika.kahola@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE4LTA4LTA5IGF0IDExOjIwICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4g
UXVvdGluZyBNaWthIEthaG9sYSAoMjAxOC0wOC0wOSAxMToxMjozMykKPiA+IAo+ID4gVG8gcmVk
dWNlIHRoZSBleGVjdXRpb24gdGltZSBvZiBrbXNfZmxpcCB0ZXN0IG9uIENJLCBsZXQncyBtb3Zl
Cj4gPiBzdWJ0ZXN0Cj4gPiBkdXJhdGlvbiBwYXJhbWV0ZXIgYXMgY29tbWFuZCBsaW5lIG9wdGlv
bi4gVGhlIGRlZmF1bHQgc3VidGVzdAo+ID4gZHVyYXRpb24KPiA+IGlzIDMgc2Vjb25kcyBmb3Ig
dGVzdCB0aGF0IHJlcXVpcmUgaml0dGVyIGNvbXB1dGF0aW9uIGFuZCBmb3IgdGhlCj4gPiByZXN0
Cj4gPiBvZiB0aGUgc3VidGVzdHMgYXJlIHJ1biBvbmx5IG9uY2UuCj4gSSBkaXNhZ3JlZSB3aXRo
IGhhdmluZyB0ZXN0cyB0aGF0IGNoYW5nZSBiZXR3ZWVuIGludm9jYXRpb25zLiBJdCdzCj4gZmFy
Cj4gdG9vIGVhc3kgZm9yIG9uZSB0byBtYWtlIGEgbWlzdGFrZSBhbmQgbm90IGNvbmZpZ3VyZSB0
aGUgdGVzdAo+IGNvcnJlY3RseSwKPiBjb21wbGV0ZWx5IGZhaXJseSB0byByZXByb2R1Y2Ugd2hh
dGV2ZXIgYnVnIG9uZSB3YXMgc2Vla2luZy4KPiAKU28sIHNob3VsZCBJIHJlbW92ZSB0aGUgb3B0
aW9uIG9mIHNldHRpbmcgdGhlIGR1cmF0aW9uIGZvciB0aGUKc3VidGVzdHM/IE9yaWdpbmFsbHks
IHdlIGhhdmUgdGltZW91dHMgcmFuZ2luZyBmcm9tIDAgdG8gMzAgc2Vjb25kcywKZGVwZW5kaW5n
IG9uIGEgdGVzdC4gQmFzZWQgb24gbXkgdGVzdHMgb24gR0xLLCBJIGZvdW5kIG91dCB0aGF0IHRl
c3RzCnRoYXQgcmVxdWlyZSBzb21lIGppdHRlciBjb21wdXRhdGlvbiB5aWVsZHMgdGhlIHNpbWls
YXIgcmVzdWx0cyBpZiB3ZQpydW4gaXQgZm9yIDMgb3IgMzAgc2Vjb25kcy4gV2hlbiBydW5uaW5n
IGxlc3MgdGhhbiAzIHNlY29uZHMgdGhlcmUgYXJlCmRpZmZlcmVuY2VzIGluIGppdHRlciByZXN1
bHRzLiBUaGF0J3Mgd2h5IEkgc3VnZ2VzdGVkIHRoYXQgMyBzZWNvbmRzCndvdWxkIGJlIGEgc3dl
ZXRzcG90IGZvciB0aGUgc3VidGVzdHMuCgpTaG91bGQgSSBqdXN0IHVzZSAzIHNlY29uZHMgdGlt
ZW91dCBmb3IgYWxsIHN1YnRlc3RzIGFuZCBkaXNjYXJkIHRoZQpwb3NzaWJpbGl0eSB0byBzZXQg
dGhlIHRpbWVvdXQ/wqAKCj4gSWYgeW91IHRoaW5rIGJvdGggZHVyYXRpb25zIGFyZSBpbnRlcmVz
dGluZyBmb3IgZGlmZmVyZW50IGFzcGVjdHMsCj4gdGVzdAo+IGJvdGguCj4gLUNocmlzCi0tIApN
aWthIEthaG9sYSAtIEludGVsIE9UQwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
