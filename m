Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052236E226
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2019 20:32:04 +0000 (UTC)
Date: Fri, 27 Sep 2019 13:32:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20190927203203.tsmwk7vrxbotlz6n@ldmartin-desk1>
References: <20190920010723.27300-1-lucas.demarchi@intel.com>
 <156961499065.1880.13073384019803070359@skylake-alporthouse-com>
 <20190927202420.l4pzgzwv2imugbmx@ldmartin-desk1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927202420.l4pzgzwv2imugbmx@ldmartin-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/kmod: reimplement kmsg_dump()
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDE6MjQ6MjBQTSAtMDcwMCwgTHVjYXMgRGUgTWFyY2hp
IHdyb3RlOgo+T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDk6MDk6NTBQTSArMDEwMCwgQ2hyaXMg
V2lsc29uIHdyb3RlOgo+PlF1b3RpbmcgTHVjYXMgRGUgTWFyY2hpICgyMDE5LTA5LTIwIDAyOjA3
OjIzKQo+Pj5Ob3cgdGhlIGxpbmUgaW4gKDEpIHByaW50IGFzOgo+Pj4gICAgICAgIChpOTE1X3Nl
bGZ0ZXN0OjUwNzApIGlndF9rbW9kLVdBUk5JTkc6IFtkcm06aW50ZWxfcGNoX3R5cGUgW2k5MTVd
XSBGb3VuZCBUaWdlciBMYWtlIExQIFBDSAo+Cj4uLi4KPgo+Pj4KPj4+VGhpcyBhbHNvIGZpeGVz
IGEgZG91YmxlIGNsb3NlIG9uIGZjbG9zZSgpIGFscmVhZHkgY2xvc2VzIHRoZSBmaWxlCj4+PmRl
c2NyaXB0b3IuCj4+Pgo+Pj5TaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRl
bWFyY2hpQGludGVsLmNvbT4KPj4KPj5Ub28gYmFkIGl0IGRvZXNuJ3QgYWN0dWFsbHkgd29yayBh
bmQgYmFpbHMgb24gdGhlIGZpcnN0IHJlYWQgd2l0aCBFUElQRS4KPgo+aHVtbi4uLiBJIGNvcHkt
cGFzdGVkIHRoZSBsaW5lIGFib3ZlLgo+Cj5DaGVja2luZyBwcmludGsuYyBpdCB3aWxsIGhhcHBl
biBpZiB3ZSBleHBsb2RlIHRoZSByaW5nYnVmZmVyIHdpdGggbG9nIG1lc3NhZ2VzCj5iZWZvcmUg
YWN0dWFsbHkgcmVhZGluZyB0aGVtLiBZb3UgbWF5IHdhbnQgdG8gaW5jcmVhc2UgdGhlIGJ1ZmZl
ciBzaXplCj50byBnZXQgdGhlbSBhbGwsIGJ1dCBpdCBtYXkgbWFrZSBzZW5zZSB0byBjb250aW51
ZSBvbiBFUElQRSBzaW5jZSB0aGUKPmJlaGF2aW9yIGlzIHRvIHJlc2V0IHRvIHRoZSBmaXJzdCBh
dmFpbGFibGUgbWVzc2FnZT8KCmJ0dyBBRkFJQ1MgdGhlIHByZXZpb3VzIGltcGwgd291bGQgZXF1
YWxseSBiYWlsIG91dCBkdWUgdG8gZ2V0bGluZSgpCnJldHVybmluZyAtMS4gT3IgZGlkIEkgbWlz
cyBhbnl0aGluZz8gKGFsc28gdGhlIGRlZmF1bHQgYnVmZmVyIHNpemUgdXNlZApieSBnbGliYyBp
cyB0aGUgc2FtZSBhcyB0aGUgb25lIEknbSB1c2luZyBoZXJlKQoKTHVjYXMgRGUgTWFyY2hpCgo+
Cj5MdWNhcyBEZSBNYXJjaGkKPgo+Pi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
