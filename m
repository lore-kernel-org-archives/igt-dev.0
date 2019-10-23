Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191023090752.23566-1-janusz.krzysztofik@linux.intel.com>
References: <20191023090752.23566-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <157182189532.11484.5502218239626360200@skylake-alporthouse-com>
Date: Wed, 23 Oct 2019 10:11:35 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/gem_exec_reloc: Don't filter
 out addresses when on PPGTT
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

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMTktMTAtMjMgMTA6MDc6NTEpCj4gQ29tbWl0
IGEzNTViMmQ2ZWI0MiAoImlndC9nZW1fZXhlY19yZWxvYzogRmlsdGVyIG91dCB1bmF2YWlsYWJs
ZQo+IGFkZHJlc3NlcyBmb3IgIXBwZ3R0IikgaW50cm9kdWNlZCBmaWx0ZXJpbmcgb2YgYWRkcmVz
c2VzIHBvc3NpYmx5Cj4gb2NjdXBpZWQgYnkgb3RoZXIgdXNlcnMgb2Ygc2hhcmVkIEdUVC4gIFVu
Zm9ydHVuYXRlbHksIHRoYXQgZmlsdGVyaW5nCj4gaXMgdW5jb25kaXRpb25hbCwgbm8gbWF0dGVy
IGlmIHJ1bm5pbmcgb24gb2xkIHNoYXJlZCBHVFQgb3Igbm90LiAgV2hlbgo+IHJ1bm5pbmcgb24g
UFBHVFQsIHRoYXQgbWF5IHJlc3VsdCBpbiBlcnJvcnMgb3RoZXIgdGhhbiB0aG9zZSBpbnRlbmRl
ZAo+IHRvIGJlIHNraXBwZWQgb3ZlciBiZWluZyBzaWxlbnRseSBpZ25vcmVkLgoKWW91IGZvcmdv
dCB0aGUgYWxpYXNpbmctcHBndHQgd2hpY2ggaGFzIGV4YWN0bHkgdGhlIHNhbWUgaXNzdWVzIHdp
dGgKcmVzZXJ2ZWQgbG9jYXRpb25zIChzaW5jZSBpdCBpcyBhIG1pcnJvciBvZiB0aGUgR0dUVCku
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
