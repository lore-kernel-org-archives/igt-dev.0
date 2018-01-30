Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9656E760
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 09:54:51 +0000 (UTC)
References: <20180124102500.71999-1-maarten.lankhorst@linux.intel.com>
 <151679208421.13096.6619668340989603229@mail.alporthouse.com>
 <891fc5fe-db82-16d3-970e-18eff5d32b2a@linux.intel.com>
 <20180130080114.GN2759@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <86f27961-8aaa-44b5-2f2e-2f4be9b5e70e@linux.intel.com>
Date: Tue, 30 Jan 2018 10:54:46 +0100
MIME-Version: 1.0
In-Reply-To: <20180130080114.GN2759@phenom.ffwll.local>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_render: Rewrite test to take
 advantage of igt_display.
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGV5LAoKT3AgMzAtMDEtMTggb20gMDk6MDEgc2NocmVlZiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdl
ZCwgSmFuIDI0LCAyMDE4IGF0IDEyOjIyOjA3UE0gKzAxMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdy
b3RlOgo+PiBPcCAyNC0wMS0xOCBvbSAxMjowOCBzY2hyZWVmIENocmlzIFdpbHNvbjoKPj4+IFF1
b3RpbmcgTWFhcnRlbiBMYW5raG9yc3QgKDIwMTgtMDEtMjQgMTA6MjU6MDApCj4+Pj4gVGhpcyB0
ZXN0IHdhcyB0YWtpbmcgfjEwMHMgZm9yIGVhY2ggc3VidGVzdCwgYW5kIGJvdGggdGVzdHMgd2Vy
ZSB0aGUgc2FtZSwKPj4+PiBidXQgcmVxdWlyZWQgdGhlIHVzZXIgdG8gcGF5IGF0dGVudGlvbi4g
SSd2ZSBjaGFuZ2VkIGl0IHRvIGF1dG9tYXRlZAo+Pj4+IGNoZWNraW5nIHdpdGggQ1JDLCBhbmQg
cmVtb3ZlZCB0aGUgc3VidGVzdHMuCj4+PiBXaGF0IGRvIHdlIGRvIGhlcmUgdGhhdCBpc24ndCBj
b3ZlcmVkIGJ5IGttc19mcm9udGJ1ZmZlcio/IE15IGd1ZXNzCj4+PiB3b3VsZCBiZSBkbyBzaW1w
bGUgdGVzdGluZyBvZiBtb3JlIGNvbmZpZ3VyYXRpb25zIChhcyBvcHBvc2VkIHRvCj4+PiBrbXNf
ZnJvbnRidWZmZXIgdGhhdCBkb2VzIGxvdHMgb2YgZGlmZmVyZW50IGRyYXdpbmcgdG8gdGhlIHNh
bWUKPj4+IGNvbmZpZ3VyYXRpb24pLgo+PiBIbSBwcm9iYWJseSByaWdodC4gSSB3b3VsZG4ndCBt
aW5kIHJlbW92aW5nIGl0IHRvbywgdG8gYmUgaG9uZXN0Li4KPiBPcmlnaW5hbGx5IGFkZGVkIGJ5
IEltcmUgYW5kIHJldmlld2VkIGJ5IFJvZHJpZ28sIGJ1dCBubyBtZW50aW9uIHdoeSB3ZQo+IG5l
ZWQgdGhpcyB0ZXN0Y2FzZToKPgo+IGNvbW1pdCA1MjhiMWYzODFjNGU2N2MyZTYzZTIzYjU1OTcw
NzBmZmZlODAzM2Q2Cj4gQXV0aG9yOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Cj4g
RGF0ZTogICBUaHUgTWF5IDMwIDIyOjU5OjU5IDIwMTMgKzAzMDAKPgo+ICAgICB0ZXN0czogYWRk
IGttc19yZW5kZXIKPiAgICAgCj4gICAgIEFkZCBhIHRlc3QgZ29pbmcgdGhyb3VnaCBhbGwgY29u
bmVjdG9ycy9jcnRjcy9tb2Rlcy9mb3JtYXRzIHBhaW50aW5nIHRvCj4gICAgIGEgZnJvbnQgRkIg
d2l0aCBDUFUgb3IgcGFpbnRpbmcgdG8gYSBiYWNrIEZCIHdpdGggQ1BVIGFuZCBibGl0dGluZyBp
dAo+ICAgICB0byB0aGUgZnJvbnQgRkIuCj4gICAgIAo+ICAgICBPbmx5IGZvcm1hdHMgdW5kZXJz
dG9vZCBieSBjYWlybyBhcmUgc3VwcG9ydGVkIGZvciBub3cuCj4gICAgIAo+ICAgICBTaWduZWQt
b2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Cj4gICAgIFJldmlld2VkLWJ5
OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBnbWFpbC5jb20+Cj4KPiBJJ20gdm90aW5nIGZv
ciByZW1vdmFsIHRvbywgYXNzdW1pbmcgSW1yZSBkb2Vzbid0IGNvbWUgdXAgd2l0aCBhIHZlcnkg
Z29vZAo+IHJlYXNvbiBmb3Igd2h5IHdlIG5lZWQgaXQuCj4gLURhbmllbAoKT2sgSSdsbCB3YWl0
IGEgZmV3IGRheXMgbG9uZ2VyIHRoZW4gcmVtb3ZlIHRoaXMgdGVzdC4ga21zX2Zyb250YnVmZmVy
X3RyYWNraW5nIHByb2JhYmx5IHN1cGVyY2VlZHMgaXQuCgp+TWFhcnRlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
