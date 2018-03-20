Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DF16E80D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Mar 2018 16:27:47 +0000 (UTC)
References: <1521558752-25601-1-git-send-email-tomasz.lis@intel.com>
 <152155985916.3594.11009668418899845150@mail.alporthouse.com>
 <152156017243.3594.9505968035096414599@mail.alporthouse.com>
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Message-ID: <f4952296-4e66-03c9-1fcd-7312b581eed6@intel.com>
Date: Tue, 20 Mar 2018 17:27:44 +0100
MIME-Version: 1.0
In-Reply-To: <152156017243.3594.9505968035096414599@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC v1] Data Port Coherency tests.
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: bartosz.dunajski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMDE4LTAzLTIwIDE2OjM2LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gUXVvdGluZyBDaHJp
cyBXaWxzb24gKDIwMTgtMDMtMjAgMTU6MzA6NTkpCj4+IFF1b3RpbmcgVG9tYXN6IExpcyAoMjAx
OC0wMy0yMCAxNToxMjozMikKPj4+IEZyb206ICJMaXMsIFRvbWFzeiIgPHRvbWFzei5saXNAaW50
ZWwuY29tPgo+Pj4KPj4+IFRoaXMgYWRkcyBhIG5ldyB0ZXN0IGJpbmFyeSwgY29udGFpbmluZyB0
ZXN0cyBmb3IgdGhlIERhdGEgUG9ydCBDb2hlcmVuY3kKPj4+IG9wdGlvbi4gVGhlIHRlc3RzIGNo
ZWNrIHdoZXRoZXIgdGhlIG9wdGlvbiBpcyBjb3JyZWN0bHkgc2V0IHRvIHByb3BlciBHUFUKPj4+
IHJlZ2lzdGVyLgo+PiBCdXQgd2hlcmUncyB0aGUgdGVzdCB0aGF0IGl0ICpkb2VzKiBhbnl0aGlu
Zz8gSS5lLiB3aGF0J3MgdGhlIGV4cGVjdGVkCj4+IGNoYW5nZSBpbiB1c2VyIHZpc2libGUgYmVo
YXZpb3VyPyAoV2hhdCBkb2VzIHRoZSBmbGFnIHJlYWxseSBtZWFuLCBub3cKPj4gYW5kIGZvciB5
ZWFycyB0byBjb21lPykKCldpdGggYSB0ZXN0IHRoYXQgImRvZXMgYW55dGhpbmciICh3aGljaCBJ
IHVuZGVyc3RhbmQgYXMgLSBzdWJtaXR0aW5nIGxhcmdlIHdvcmtsb2FkIGFuZCBjaGVja2luZyB0
aGUgY29oZXJlbmN5IHdoaWxlIHRoZSB3b3JrbG9hZCBpcyBleGVjdXRpbmcpIHdlIHdvdWxkIGJl
IHRlc3RpbmcgdGhlIGhhcmR3YXJlLCBub3QgdGhlIGtlcm5lbC4KSSBwcmVwYXJlZCBhIHRlc3Qg
YmluYXJ5IGRlc2lnbmVkIHRvIHRlc3QgdGhlIGtlcm5lbCBjaGFuZ2UgSSBwcm9wb3NlZC4gVGhp
cyBpcyB3aGF0IEkgY29uc2lkZXIgZ29vZCBwcmFjdGljZXMuCkRvIHdlIGhhdmUgYW5vdGhlciBh
cHByb2FjaCB3aGVuIGRldmVsb3BpbmcgSUdUPwoKPiBUbyBiZSBjbGVhcjsgdGhpcyB0ZXN0IGls
bHVzdHJhdGVzIHRoYXQgaXQgaXMgYSBjb250ZXh0IHJlZ2lzdGVyIGJlaW5nCj4gdHdlYWtlZCBh
bmQgbm90IGFuIGV4ZWNidWYgcHJvcGVydHkuCj4gLUNocmlzCkkgYWdyZWUgdGhlIGhhcmR3YXJl
IGZsYWcgaXMgd2l0aGluIGhhcmR3YXJlIGNvbnRleHQuIEJvdGggdGhlIGtlcm5lbCAKcGF0Y2gg
YW5kIHRoZSBJR1QgdGVzdCBhcmUgYWNjZXNzaW5nIHRoYXQgYml0LCBzbyB0aGV5IGJvdGggaWxs
dXN0cmF0ZSAKaXQgaXMgYSBjb250ZXh0IHJlZ2lzdGVyLgpCdXQgYm90aCBwYXRjaGVzIGFsc28g
aW1wbGVtZW50IFVNRCBpbnRlcmZhY2UgdG8gdGhhdCBmbGFnIHZpYSBleGVjYnVmIApmbGFnLiBX
aGF0IGRvIHlvdSBtZWFuIHdoZW4geW91IHdyaXRlIHRoaXMgaXMgIm5vdCBhbiBleGVjYnVmIHBy
b3BlcnR5Ij8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
