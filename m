Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200226125746.12249-1-janusz.krzysztofik@linux.intel.com>
References: <20200226125746.12249-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <158272854017.4613.11552037429170445400@skylake-alporthouse-com>
Date: Wed, 26 Feb 2020 14:49:00 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/gem_userptr_blits: Refresh
 map-fixed-invalidate* subtests
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMjAtMDItMjYgMTI6NTc6NDYpCj4gbWFwLWZp
eGVkLWludmFsaWRhdGUqIHN1YnRlc3RzIHV0aWxpemUgZ2VtX3NldF90aWxpbmcoKSB3aGljaCBt
YXkgZmFpbCwKPiBlLmcuIG9uIGhhcmR3YXJlIHdpdGggbm8gbWFwcGFibGUgYXBlcnR1cmUsIGR1
ZSB0byBtaXNzaW5nIGZlbmNlcy4KPiBTa2lwIHRob3NlIHN1YnRlc3RzIGlmIGZlbmNlcyBhcmUg
bm90IGF2YWlsYWJsZS4KPiAKPiBNb3Jlb3ZlciwgdGhvc2Ugc3VidGVzdHMgdXNlIEdFTV9NTUFQ
X0dUVCBJT0NUTCB3aGljaCBoYXMgYmVlbiByZXBsYWNlZAo+IGJ5IEdFTV9NTUFQX09GRlNFVCB0
aGF0IHN1cHBvcnRzIG90aGVyIG1hcHBpbmcgdHlwZXMsIG5vdCBvbmx5IEdUVC4KPiBVc2UgdGhl
IG5ldyBJT0NUTCBhbmQgZHluYW1pY2FsbHkgZXhhbWluZSBhbGwgTU1BUF9PRkZTRVQgdHlwZXMK
PiBzdXBwb3J0ZWQgYnkgaGFyZHdhcmUuCj4gCj4gdjI6IEV4YW1pbmUgYWxsIHN1cHBvcnRlZCBN
TUFQX09GRlNFVCB0eXBlcywgbm90IG9ubHkgdGhlIGZpcnN0IG9uZQo+ICAgICB0aGF0IHdvcmtz
LAo+ICAgLSBhZGQgc3VidGVzdCBkZXNjcmlwdGlvbi4KPiB2MzogUmVmcmVzaCBvbiB0b3Agb2Yg
Y29tbWl0IDM4NGU3ZWNiNzQ2NCAoImxpYi9pOTE1OiBSZXN0cmljdCBtbWFwCj4gICAgIHR5cGVz
IHRvIEdUVCBpZiBubyBNTUFQX09GRlNFVCBzdXBwb3J0IikuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmFudXN6IEtyenlzenRvZmlrIDxqYW51c3oua3J6eXN6dG9maWtAbGludXguaW50ZWwuY29tPgo+
IENjOiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+CkxndG0s
ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
