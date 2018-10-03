Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <7287aacb-ae70-7c4f-420b-46f27e0910cf@intel.com>
References: <20180928102002.10541-1-chris@chris-wilson.co.uk>
 <c67237b6-a3e5-4d11-a483-aa7ecd800ff4@intel.com>
 <153842301482.23109.9425007086680751049@skylake-alporthouse-com>
 <b01d74fe-763a-0b65-b0b9-49ca091077b6@intel.com>
 <153846900061.7415.2196966772772919022@jlahtine-desk.ger.corp.intel.com>
 <7287aacb-ae70-7c4f-420b-46f27e0910cf@intel.com>
Message-ID: <153857186067.4477.7493889521236990498@jlahtine-desk.ger.corp.intel.com>
Date: Wed, 03 Oct 2018 16:04:20 +0300
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/5] igt/kms_getfb: Check
 the iface exists before use
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMTAtMDIgMjM6Mjc6NDYpCj4gCj4gCj4g
T24gMDIvMTAvMTggMDE6MzAsIEpvb25hcyBMYWh0aW5lbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50
b25pbyBBcmdlbnppYW5vICgyMDE4LTEwLTAxIDIyOjUzOjQ2KQo+ID4+IEZhaXIgZW5vdWdoLgo+
ID4+Cj4gPj4gQWNrZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5v
QGludGVsLmNvbT4KPiA+Pgo+ID4+IGZvciB0aGUgc2VyaWVzLgo+ID4gCj4gPiBQbGVhc2UsIHJl
YWQgdGhlIGZvbGxvd2luZyBjaGFwdGVycyAodGhleSdyZSBhcHBsaWNhYmxlIGZvciB0aGUgcGF0
Y2gKPiA+IHRhZyBtZWFuaW5ncyBpbiBJR1QsIHRvbyk6Cj4gPiAKPiA+IGh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL2h0bWwvdjQuMTgvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCN3
aGVuLXRvLXVzZS1hY2tlZC1ieS1jYy1hbmQtY28tZGV2ZWxvcGVkLWJ5Cj4gPiBodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjE4L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0
bWwjdXNpbmctcmVwb3J0ZWQtYnktdGVzdGVkLWJ5LXJldmlld2VkLWJ5LXN1Z2dlc3RlZC1ieS1h
bmQtZml4ZXMKPiA+IAo+ID4gSWYgd2Ugc3BlbmQgdGhlIHRpbWUgdG8gYWN0dWFsbHkgcmV2aWV3
IHRoZSBwYXRjaGVzLCB0aGF0IHNob3VsZCBiZQo+ID4gZG9jdW1lbnRlZCB3aXRoIGEgcHJvcGVy
IFJldmlld2VkLWJ5IGFuZCBub3QgYSB2YWd1ZSBBY2tlZC1ieS4KPiAKPiBLTVMgaXMgcmVhbGx5
IGFuIGFyZWEgSSBkbyBub3Qga25vdyBtdWNoIGFib3V0LiBXaGlsZSBJIGNhbiBzYXkgdGhlIAo+
IHBhdGNoZXMgYXJlIGxvb2tpbmcgZ29vZCBvbiB0aGUgSUdUIHNpZGUsIEkgY2Fubm90IGd1YXJh
bnRlZSB0aGV5IHVzZSAKPiB0aGUgS01TIGludGVyZmFjZSBhcHByb3ByaWF0ZWx5IHRoZXJlZm9y
ZSB0aGUgJ0Fja2VkLWJ5Jy4gQWZ0ZXIgcmVhZGluZyAKPiB0aGUgZG9jdW1lbnRhdGlvbiB5b3Ug
bGlua2VkIEkgdGhpbmsgaXQgZml0cyByYXRoZXIgd2VsbCBzaW5jZSB0aGUgb25seSAKPiBmZWVk
YmFjayBJIGdhdmUgd2FzIG9uIGEgc21hbGwgb3ZlcnNpZ2h0LgoKRmFpciBlbm91Z2guIEZvciBm
dXR1cmUgcmVmZXJlbmNlLCB5b3UgbWF5IHdhbnQgdG8gY29tbWVudCB3aGVuIGdpdmluZwp5b3Vy
IEFja2VkLWJ5LCB0aGUgcmVhc29uIGZvciBvbmx5IGxpbWl0ZWQgcmV2aWV3IGFuZCBub3QgZnVs
bCBSLWIuCgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
