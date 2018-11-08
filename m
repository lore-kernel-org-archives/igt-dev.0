Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AFD6E60D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Nov 2018 11:47:54 +0000 (UTC)
References: <1533809554-27925-1-git-send-email-mika.kahola@intel.com>
 <1533809554-27925-2-git-send-email-mika.kahola@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <0e4681c0-c84d-f6c1-2a4a-d251b28fa103@linux.intel.com>
Date: Thu, 8 Nov 2018 12:47:52 +0100
MIME-Version: 1.0
In-Reply-To: <1533809554-27925-2-git-send-email-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/2] tests/kms_flip: Set duration for
 subtest from command line
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
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDktMDgtMTggb20gMTI6MTIgc2NocmVlZiBNaWthIEthaG9sYToKPiBUbyByZWR1Y2UgdGhl
IGV4ZWN1dGlvbiB0aW1lIG9mIGttc19mbGlwIHRlc3Qgb24gQ0ksIGxldCdzIG1vdmUgc3VidGVz
dAo+IGR1cmF0aW9uIHBhcmFtZXRlciBhcyBjb21tYW5kIGxpbmUgb3B0aW9uLiBUaGUgZGVmYXVs
dCBzdWJ0ZXN0IGR1cmF0aW9uCj4gaXMgMyBzZWNvbmRzIGZvciB0ZXN0IHRoYXQgcmVxdWlyZSBq
aXR0ZXIgY29tcHV0YXRpb24gYW5kIGZvciB0aGUgcmVzdAo+IG9mIHRoZSBzdWJ0ZXN0cyBhcmUg
cnVuIG9ubHkgb25jZS4KPgo+IHYyOiBSdW4gZWFjaCBzdWJ0ZXN0IG9ubHkgb25jZSAoZGVmYXVs
dCBhY3Rpb24pCj4gdjM6IFJlZHVjZXMgZGVmYXVsdCB0aW1lb3V0IGZvciB0ZXN0cyB0aGF0IHJl
cXVpcmUgaml0dGVyIGNvbXB1dGF0aW9uIChWaWxsZSkKPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2Eg
S2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+CkkgdGhpbmsgdGhpcyBpcyB0aGUgd3Jvbmcg
YXBwcm9hY2guIFdoYXQgd2UgcmVhbGx5IHdhbnQgdG8gZG8gaXMga2lsbCB0ZXN0cyBmcm9tIGtt
c19mbGlwCmluc3RlYWQgYW5kIG1vdmUgdGhlbSB0byBzZXBhcmF0ZSBwbGFjZXMuCgpLaWxsaW5n
IG9mZiBhbGwgdGhlIGludGVycnVwdGlibGUgdGVzdHMgd291bGQgc2F2ZSA1MCUgb2YgdGhlIHRp
bWUuIFNvIGFsbCB3ZSBoYXZlIHRvIGRvIGlzCm1ha2luZyBzdXJlIHRoYXQgd2UgaGF2ZSB0ZXN0
cyB0aGF0IHRlc3QgdGhlIG1pc3NpbmcgaW9jdGwncyBpbiBpbiBrbXNfYXRvbWljX2ludGVycnVw
dGlibGUsCmFuZCB3ZSB3b3VsZCBzYXZlIDUwJSBvZiB0aGUgdGltZS4KCkFmdGVyIHRoYXQgd2Ug
aGF2ZSB0byBnZXQgcmlkIG9mIHRoZSB1bnJlbGF0ZWQgdGVzdHMgdG8gbWFrZSB0aGUgY29kZSBt
b3JlIHJlYWRhYmxlLi4Kbm9uZXhpc3RpbmctZmIsIGRwbXMtdnMtdmJsYW5rLXJhY2UsIG1vZGVz
ZXQtdnMtdmJsYW5rLXJhY2UgYW5kIGJvLXRvby1iaWcgd291bGQgYmUKYmV0dGVyIG9mZiBpbiBh
IHNlcGFyYXRlIHRlc3RjYXNlLgoKU2FtZSBmb3IgYmFkLXRpbGluZywgYnV0IEkgYWxyZWFkeSBo
YWQgYSBwYXRjaCBmb3IgdGhhdC4KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoLzI1OTM2MS8KClRoaXMgd291bGQgY2xlYW4gdXAga21zX2ZsaXAgYSBsb3QsIGFuZCBtYWtl
IHRoZSB0ZXN0IG1vcmUgcmVhZGFibGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
