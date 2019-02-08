Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED216EDD9
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:24:03 +0000 (UTC)
Date: Fri, 8 Feb 2019 14:23:59 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190208132359.GA27881@kdec5-desk.ger.corp.intel.com>
References: <20190208131037.22811-1-katarzyna.dec@intel.com>
 <154963166124.3378.17047892724983888827@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <154963166124.3378.17047892724983888827@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_parallel: Add
 skip_on_simulation to whole binary
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBGZWIgMDgsIDIwMTkgYXQgMDE6MTQ6MjZQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgS2F0YXJ6eW5hIERlYyAoMjAxOS0wMi0wOCAxMzoxMDozNykKPiA+IE9u
IHNpbXVsYXRpb24gZW52aXJvbm1lbnQgdGhlc2UgdGVzdHMgd2VyZSBmYWlsaW5nLiBEdXJpbmcg
ZGVidWcKPiA+IHdlIGRlY2lkZWQgdGhhdCB3aG9sZSBiaW5hcnkgc2hvdWxkIGJlIHNraXBwZWQs
IGJlY2F1c2UgdGhlcmUgaXMKPiA+IG5vIGFkZGl0aW9uYWwgY292ZXJhZ2UgaW4gc2ltdWxhdGlv
bi4KPiAKPiBIb3cgZGlkIHRoZXkgZmFpbD8gVGhlcmUgYXJlIHNvbWUgcGF0aHMgaGVyZSB0aGF0
IGFyZSByYXJlbHkgdG91Y2hlZAo+IGVsc2V3aGVyZS4KPiAtQ2hyaXMKSSBsaWtlIHlvdSBjaGFs
bGVuZ2VzIENocmlzIDopCgpnZW1fZXhlY19wYXJhbGxlbEAqY29udGV4dCogd2VyZSBmYWlsaW5n
IHdpdGggZXJyb3I6CgooZ2VtX2V4ZWNfcGFyYWxsZWw6MTI0NSkgaW9jdGxfd3JhcHBlcnMtQ1JJ
VElDQUw6IFRlc3QgYXNzZXJ0aW9uIGZhaWx1cmUKZnVuY3Rpb24gZ2VtX2V4ZWNidWYsIGZpbGUg
Li4vbGliL2lvY3RsX3dyYXBwZXJzLmM6NjA1OgooZ2VtX2V4ZWNfcGFyYWxsZWw6MTI0NSkgaW9j
dGxfd3JhcHBlcnMtQ1JJVElDQUw6IEZhaWxlZCBhc3NlcnRpb246Cl9fZ2VtX2V4ZWNidWYoZmQs
IGV4ZWNidWYpID09IDAKKGdlbV9leGVjX3BhcmFsbGVsOjEyNDUpIGlvY3RsX3dyYXBwZXJzLUNS
SVRJQ0FMOiBlcnJvcjogLTI4ICE9IDAKCmFuZCBAKmZkcyogd2l0aDoKCihnZW1fZXhlY19wYXJh
bGxlbDoxMzE1KSBpZ3RfZGVidWdmcy1DUklUSUNBTDogTGFzdCBlcnJubzogMjQsIFRvbyBtYW55
IG9wZW4KZmlsZXMKCkFmdGVyIGRpc2N1c3Npb24gd2l0aCBVcnN1bGluIFR2cnRrbyB3ZSBkZWNp
ZGVkIHRoYXQgaXQgaXMgcmVkdW5kYW50IHRvIHJ1biBpdApvbiBzaW11bGF0aW9uLgpQcm9iYWJs
eSBteSBjb21taXQgbXNnIHdhcyBsYWNraW5nIHNvbWUgaW5mb3JtYXRpb24uCgpLYXNpYSA6KQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
