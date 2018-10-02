Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180928102002.10541-1-chris@chris-wilson.co.uk>
 <c67237b6-a3e5-4d11-a483-aa7ecd800ff4@intel.com>
 <153842301482.23109.9425007086680751049@skylake-alporthouse-com>
 <b01d74fe-763a-0b65-b0b9-49ca091077b6@intel.com>
 <153846900061.7415.2196966772772919022@jlahtine-desk.ger.corp.intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <7287aacb-ae70-7c4f-420b-46f27e0910cf@intel.com>
Date: Tue, 2 Oct 2018 13:27:46 -0700
MIME-Version: 1.0
In-Reply-To: <153846900061.7415.2196966772772919022@jlahtine-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/5] igt/kms_getfb: Check
 the iface exists before use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwMi8xMC8xOCAwMTozMCwgSm9vbmFzIExhaHRpbmVuIHdyb3RlOgo+IFF1b3RpbmcgQW50
b25pbyBBcmdlbnppYW5vICgyMDE4LTEwLTAxIDIyOjUzOjQ2KQo+PiBGYWlyIGVub3VnaC4KPj4K
Pj4gQWNrZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVs
LmNvbT4KPj4KPj4gZm9yIHRoZSBzZXJpZXMuCj4gCj4gUGxlYXNlLCByZWFkIHRoZSBmb2xsb3dp
bmcgY2hhcHRlcnMgKHRoZXkncmUgYXBwbGljYWJsZSBmb3IgdGhlIHBhdGNoCj4gdGFnIG1lYW5p
bmdzIGluIElHVCwgdG9vKToKPiAKPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0
LjE4L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwjd2hlbi10by11c2UtYWNrZWQtYnkt
Y2MtYW5kLWNvLWRldmVsb3BlZC1ieQo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
djQuMTgvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCN1c2luZy1yZXBvcnRlZC1ieS10
ZXN0ZWQtYnktcmV2aWV3ZWQtYnktc3VnZ2VzdGVkLWJ5LWFuZC1maXhlcwo+IAo+IElmIHdlIHNw
ZW5kIHRoZSB0aW1lIHRvIGFjdHVhbGx5IHJldmlldyB0aGUgcGF0Y2hlcywgdGhhdCBzaG91bGQg
YmUKPiBkb2N1bWVudGVkIHdpdGggYSBwcm9wZXIgUmV2aWV3ZWQtYnkgYW5kIG5vdCBhIHZhZ3Vl
IEFja2VkLWJ5LgoKS01TIGlzIHJlYWxseSBhbiBhcmVhIEkgZG8gbm90IGtub3cgbXVjaCBhYm91
dC4gV2hpbGUgSSBjYW4gc2F5IHRoZSAKcGF0Y2hlcyBhcmUgbG9va2luZyBnb29kIG9uIHRoZSBJ
R1Qgc2lkZSwgSSBjYW5ub3QgZ3VhcmFudGVlIHRoZXkgdXNlIAp0aGUgS01TIGludGVyZmFjZSBh
cHByb3ByaWF0ZWx5IHRoZXJlZm9yZSB0aGUgJ0Fja2VkLWJ5Jy4gQWZ0ZXIgcmVhZGluZyAKdGhl
IGRvY3VtZW50YXRpb24geW91IGxpbmtlZCBJIHRoaW5rIGl0IGZpdHMgcmF0aGVyIHdlbGwgc2lu
Y2UgdGhlIG9ubHkgCmZlZWRiYWNrIEkgZ2F2ZSB3YXMgb24gYSBzbWFsbCBvdmVyc2lnaHQuCgpU
aGFua3MsCkFudG9uaW8KCj4gCj4gUmVnYXJkcywgSm9vbmFzCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
