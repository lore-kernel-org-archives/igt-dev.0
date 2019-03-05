Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C99189B48
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 11:21:13 +0000 (UTC)
References: <1551577146-2348-1-git-send-email-kevin.strasser@intel.com>
 <1551577146-2348-2-git-send-email-kevin.strasser@intel.com>
 <bbbdcebc-8967-06b3-e0a3-f72c3445f83e@linux.intel.com>
 <51B6C3CD1F10FB47A5702881E0E230A793D47397@ORSMSX104.amr.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <a77cc5b7-3605-711c-1947-3d454f2262f5@linux.intel.com>
Date: Tue, 5 Mar 2019 12:21:10 +0100
MIME-Version: 1.0
In-Reply-To: <51B6C3CD1F10FB47A5702881E0E230A793D47397@ORSMSX104.amr.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC 1/5] lib: Add halffloat implementation
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
To: "Strasser, Kevin" <kevin.strasser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDQtMDMtMjAxOSBvbSAxODowMyBzY2hyZWVmIFN0cmFzc2VyLCBLZXZpbjoKPiBNYWFydGVu
IExhbmtob3JzdCB3cm90ZToKPj4gNCBmdW5jdGlvbiBjYWxscyBmb3IgZXZlcnkgcGl4ZWwgaXMg
YSBiaXQgbXVjaC4gSXMgdGhlcmUgYW55IGNsZWFuZXIgd2F5IHdlCj4+IGNvdWxkIGFjY29tcGxp
c2ggdGhlIHNhbWU/Cj4+Cj4+IHZvaWQgaWd0X2Zsb2F0X3RvX2hhbGYoY29uc3QgZmxvYXQgKiwg
dWludDE2X3QgKiwgaW50IG51bSkKPj4KPj4gdm9pZCBpZ3RfaGFsZl90b19mbG9hdChjb25zdCB1
aW50MTZfdCAqLCBmbG9hdCAqLCBpbnQgbnVtKQo+Pgo+PiBJZiBubyBzd2l6emxlIGlzIHJlcXVp
cmVkLCBpdCBjb3VsZCBkbyBhbiBlbnRpcmUgbGluZSBpbiAxIGdvLCBlbHNlIHBlciA0IG9yIDMu
Cj4+Cj4+IE1pZ2h0IGJlIHdvcnRoIGl0IHRvIHN0aWxsIGRvIGEgbGluZSBpbiAxIGdvLCBldmVu
IGZvciB4cmdiLCB3aXRoIGZvcm1hdAo+PiBhbHdheXMgc2V0IHRvIHJiYTEyOGYsIGhhcmR3YXJl
IHdpbGwgaWdub3JlIHRoZSBYIGNvbXBvbmVudCBhbnl3YXkuIDopCj4+Cj4+IEFuZCB0aGVuIGlm
IHJlcXVpcmVkIHJlc3dpenpsZS4KPiBJbnRlcmVzdGluZyBpZGVhcywgSSBhZ3JlZSB3ZSBzaG91
bGQgYmUgYWJsZSB0byBzaGF2ZSBvZmYgc29tZSBvdmVyaGVhZCB3aXRoIHRoZQo+IGZ1bmN0aW9u
IGNhbGxzLiBJJ20gbm90IHNvIHN1cmUgdGhlIHBheW9mZiB3b3VsZCBiZSB3b3J0aCB0aGUgZXh0
cmEgY29udmVyc2lvbnMKPiBpbiB0aGUgeHJnYiBjYXNlLCBidXQgSSdsbCBkbyBzb21lIGV4cGVy
aW1lbnRhdGlvbiBhbmQgZml4IGFjY29yZGluZ2x5Lgo+Cj4gVGhhbmtzLAo+IEtldmluCgpKdXN0
IHRyZWF0IHhyZ2IgYXMgYXJnYiwgYWxwaGEgY2hhbm5lbCBzaG91bGQgYmUgaWdub3JlZCBieSBo
dy4gOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
