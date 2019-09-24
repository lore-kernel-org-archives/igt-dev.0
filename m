Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 24 Sep 2019 21:11:05 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20190924154105.GC24421@intel.com>
References: <20190923182325.24049-1-Bhawanpreet.Lakha@amd.com>
 <20190924095454.GE4019@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924095454.GE4019@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH] test/kms_content_protection: Use generic
 debugfs name for HDCP caps
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
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjAxOS0wOS0yNCBhdCAxMjo1NDo1NCArMDMwMCwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiBP
biBNb24sIFNlcCAyMywgMjAxOSBhdCAwMjoyMzoyNVBNIC0wNDAwLCBCaGF3YW5wcmVldCBMYWto
YSB3cm90ZToKPiA+IFJlbmFtZSAiaTkxNV9oZGNwX3NpbmtfY2FwYWJpbGl0eSIgdG8gImhkY3Bf
c2lua19jYXBhYmlsaXR5Igo+ID4gCj4gPiBUaGUgY29udGVudCBwcm90ZWN0aW9uIHRlc3RzIG9u
bHkgc3RhcnQgaWYgdGhpcyBkZWJ1Z2ZzIGVudHJ5IGV4aXN0cy4KPiA+IFNpbmNlIHRoZSBuYW1l
IGlzIHNwZWNpZmljIHRvIGludGVsIGRyaXZlciB0aGVzZSB0ZXN0cyBjYW5ub3QgYmUgdXNlZCB3
aXRoCj4gPiBvdGhlciBkcml2ZXJzLgo+ID4gCj4gPiBSZW1vdmUgImk5MTUiIHNvIHRoZSBkZWJ1
Z2ZzIG5hbWUgaXMgZ2VuZXJpYy4KPiAKPiBJIGRvbid0IHNlZSBhbnkgZHJpdmVycyBjdXJyZW50
bHkgdXNpbmcgdGhlIG5hbWUKPiAiaGRjcF9zaW5rX2NhcGFiaWxpdHkiLiBJcyB0aGUgY29udGVu
dCBvZiB0aGUgZmlsZSBpbiBvdGhlciBkcml2ZXJzCj4gdGhlIHNhbWUgYXMgaTkxNSdzPwo+IAo+
IEFuZCBpcyB0aGVyZSBhIHBsYW4gdG8gcmVuYW1lIGk5MTUncyBkZWJ1Z2ZzIGZpbGVuYW1lIHRv
Cj4gaGRjcF9zaW5rX2NhcGFiaWxpdHk/IFJhbT8KPiAKPiBBZ3JlZWQsIGZvciBhIERSSVZFUl9B
TlktdXNpbmcgdGVzdCBnZW5lcmljIG5hbWVzIGFyZSBwcmVmZXJyYWJsZSwgYnV0Cj4gdGhpcyBu
ZWVkcyBzb21lIGtpbmQgb2YgYSB0cmFuc2l0aW9uIHBsYW4uIElmIGk5MTUncyBmaWxlbmFtZSBp
cwo+IHN0YXlpbmcgYXMgaXMsIGJvdGggbmFtZXMgbmVlZCB0byBiZSB0cmllZC4KVGhpcyBJR1Qg
dGVzdCBjaGFuZ2UgaGFzIHRvIHdhaXQgdW50aWxsIHdlIGhhdmUgdGhlCmk5MTVfaGRjcF9zaW5r
X2NhcGFiaWxpdGllcyByZW5hbWVkLCBpZiBhdCBhbGwgd2UgcmVuYW1lLgoKRWxzZSBiYXNlZCBv
biBkcm1fZGV2aWNlIHdlIGNvdWxkIGRlY2lkZSB0aGUgZGVidWdmcyBmaWxlIGFuZCByZWFkIGl0
LgoKRGFuaWVsLApDb25zaWRlcmluZyBhbGwgb3RoZXIgZGVidWdmcyBhcmUgcHJlZml4ZWQgd2l0
aCBpOTE1LCBjb3VsZCB3ZSByZW5hbWUgdGhpcwpkZWJ1Z2ZzIGFzICJoZGNwX3NpbmtfY2FwYWJp
bGl0aWVzIiBpbnN0ZWFkPwoKLVJhbQo+IAo+IAo+IC0tIAo+IFBldHJpIExhdHZhbGEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
