Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190104153709.19350-1-tvrtko.ursulin@linux.intel.com>
 <20190107110125.GW17124@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <ee86d31e-c39e-e854-1a40-a58cf40545d4@linux.intel.com>
Date: Mon, 7 Jan 2019 11:12:30 +0000
MIME-Version: 1.0
In-Reply-To: <20190107110125.GW17124@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_shrink: Exercise OOM and
 other routes to shrinking in reasonable time
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
To: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA3LzAxLzIwMTkgMTE6MDEsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MDQsIDIwMTkgYXQgMDM6Mzc6MDlQTSArMDAwMCwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0IGIvdGVzdHMvaW50ZWwtY2kv
YmxhY2tsaXN0LnR4dAo+PiBpbmRleCA3M2QxMjc2MDNkMjguLmQ3NmE0YjNiMWM3MSAxMDA2NDQK
Pj4gLS0tIGEvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAo+PiArKysgYi90ZXN0cy9pbnRl
bC1jaS9ibGFja2xpc3QudHh0Cj4+IEBAIC02MCw2ICs2MCw3IEBAIGlndEBnZW1fcmluZ19zeW5j
X2NvcHkoQC4qKT8KPj4gICBpZ3RAZ2VtX3Jpbmdfc3luY19sb29wKEAuKik/Cj4+ICAgaWd0QGdl
bV9zZXFub193cmFwKEAuKik/Cj4+ICAgaWd0QGdlbV9zaHJpbmtAKD8hcmVjbGFpbSQpLioKPj4g
K2lndEBnZW1fc2hyaW5rQCg/IXJlY2xhaW1zLWFuZC1vb20pLioKPj4gICBpZ3RAZ2VtX3NvZnRw
aW5ALiooaGFuZ3xTNCkuKgo+PiAgIGlndEBnZW1fc3Bpbl9iYXRjaChALiopPwo+PiAgIGlndEBn
ZW1fc3RvbGVuQC4qaGliZXJuYXRlLioKPiAKPiAKPiBJbiBjYXNlIHlvdSBkaWRuJ3Qgbm90aWNl
OiBUaGUgZmlyc3QgZ2VtX3NocmluayBsaW5lIHJlbW92ZXMgdGhlCj4gcmVjbGFpbXMtYW5kLW9v
bSogc3VidGVzdHMsIGFuZCB0aGUgc2Vjb25kIGxpbmUgKHRoZSBvbmUgeW91IGFkZGVkKQo+IHRo
ZW4gcmVtb3ZlcyB0aGUgJ3JlY2xhaW0nIHN1YnRlc3QsIHJlc3VsdGluZyBpbiBhbGwgZ2VtX3No
cmluawo+IHN1YnRlc3RzIGJsYWNrbGlzdGVkLgoKTm8gSSBoYXZlbid0IHRoYW5rIHlvdS4gSW50
ZXJlc3RpbmdseSB0aGUgcmVjbGFpbSBzdWJ0ZXN0IHN0aWxsIGRpZCBydW4uIApPa2F5LCBidXQg
aW4gZXNzZW5jZSBzaG91bGQgdGhpcyB3b3JrIHRoZW46CgogICBpZ3RAZ2VtX3Nocmlua0AoPyFy
ZWNsYWltKS4qCgpUbyBibGFja2xpc3QgZXZlcnl0aGluZyBhcGFydCBmcm9tIHJlY2xhaW1zIGFu
ZCByZWNsYWltcy1hbmQtb29tLiogc3VidGVzdHM/CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
