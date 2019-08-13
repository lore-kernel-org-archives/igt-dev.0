Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 13 Aug 2019 18:37:41 +0300
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190813153741.GC32007@intel.intel>
References: <20190813062016.7870-1-chris@chris-wilson.co.uk>
 <20190813062016.7870-9-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813062016.7870-9-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 9/9] i915/gem_ctx_engine: Drip feed
 requests into 'independent'
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBUdWUsIEF1ZyAxMywgMjAxOSBhdCAwNzoyMDoxNkFNICswMTAwLCBDaHJp
cyBXaWxzb24gd3JvdGU6Cj4gVGhlIGludGVudCBvZiB0aGUgdGVzdCBpcyB0byBleGVyY2lzZSB0
aGF0IGVhY2ggY2hhbm5lbCBpbiB0aGUgZW5naW5lW10KPiBpcyBhbiBpbmRlcGVuZGVudCBjb250
ZXh0L3JpbmcvdGltZWxpbmUuIEl0IHNldHVwcyA2NCBjaGFubmVscyBwb2ludGluZwo+IHRvIHJj
czAgYW5kIHRoZW4gc3VibWl0cyBvbmUgcmVxdWVzdCB0byBlYWNoIGluIHR1cm4gd2FpdGluZyBv
biBhCj4gdGltZWxpbmUgdGhhdCB3aWxsIGZvcmNlIHRoZW0gdG8gcnVuIG91dCBvZiBzdWJtaXNz
aW9uIG9yZGVyLiBUaGV5IGNhbgo+IG9ubHkgcnVuIGluIGZlbmNlIG9yZGVyIGFuZCBub3Qgc3Vi
bWlzc2lvbiBvcmRlciBpZiB0aGUgdGltZWxpbmVzIG9mCj4gZWFjaCBjaGFubmVsIGFyZSB0cnVs
eSBpbmRlcGVuZGVudC4KPiAKPiBIb3dldmVyLCB3ZSByZWxlYXNlZCB0aGUgZmVuY2VzIGVuIG1h
c3NlLCBhbmQgb25jZSB0aGUgcmVxdWVzdHMgYXJlCj4gcmVhZHkgdGhleSBhcmUgaW5kZXBlbmRl
bnQgYW55IG1heSBiZSBleGVjdXRlZCBpbiBhbnkgb3JkZXIgYnkgdGhlIEhXLAoKdHlwbyBoZXJl
Cgo+IGVzcGVjaWFsbHkgdHJ1ZSB3aXRoIHRpbWVzbGljaW5nIHRoYXQgbWF5IHJlb3JkZXIgdGhl
IHJlcXVlc3RzIG9uIGEKPiB3aGltLiBTbyBpbnN0ZWFkIG9mIHJlbGVhc2luZyBhbGwgcmVxdWVz
dHMgYXQgb25jZSwgaW5jcmVtZW50IHRoZQo+IHRpbWVsaW5lIHN0ZXAgYnkgc3RlcCBhbmQgY2hl
Y2sgd2UgZ2V0IG91ciByZXN1bHRzIGFkdmFuY2luZy4gSWYgdGhlCj4gcmVxdWVzdHMgY2FuIG5v
dCBiZSBydW4gaW4gZmVuY2Ugb3JkZXIgYW5kIGZhbGwgYmFjayB0byBzdWJtaXNzaW9uCj4gb3Jk
ZXIsIHdlIHdpbGwgdGltZSBvdXQgd2FpdGluZyBmb3Igb3VyIGluY3JlbWVudGFsIHJlc3VsdHMg
YW5kIHRyaWdnZXIKPiBhIGZldyBHUFUgaGFuZ3MuCj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVn
cy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDk4Nwo+IFNpZ25lZC1vZmYtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKTG9va3MgT0suCgpSZXZp
ZXdlZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+CgpUaGFua3MsCkFuZGkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
