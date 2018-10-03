Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDE16E400
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Oct 2018 09:51:55 +0000 (UTC)
Date: Wed, 3 Oct 2018 12:50:43 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20181003095043.GA3126@ideak-desk.fi.intel.com>
References: <1537977563-18878-1-git-send-email-jyoti.r.yadav@intel.com>
 <1537977563-18878-5-git-send-email-jyoti.r.yadav@intel.com>
 <20181002133617.GG20560@ideak-desk.fi.intel.com>
 <3c6b87b5-163f-9c5f-ad35-ae2d75bdb430@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c6b87b5-163f-9c5f-ad35-ae2d75bdb430@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1 4/6] [intel-gfx][intel-dev]
 tests/pm_dc : This patch adds test to validate DC6 on SKL. DC6 on SKL is
 achieved with RPM enabled and DPMS OFF sequence.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Yadav, Jyoti R" <jyoti.r.yadav@intel.com>
Cc: igt-dev@lists.freedesktop.org, anusha.srivatsa@intel.com, intel-gfx@lists.freedektop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDMsIDIwMTggYXQgMTA6MDc6MjdBTSArMDUzMCwgWWFkYXYsIEp5b3RpIFIg
d3JvdGU6Cj4gPiA+IFsuLi5dCj4gPiA+IEBAIC0xOTMsNiArMjA2LDE0IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pCj4gPiA+ICAgCQkJCSJEQzYgU3RhdGUgaXMgbm90IGFjaGll
dmVkXG4iKTsKPiA+ID4gICAJCWNsZWFudXAoJmRhdGEpOwo+ID4gPiAgIAl9Cj4gPiA+ICsJaWd0
X3N1YnRlc3QoIkRDNl9zdGF0ZV9vbl9nZW45Iikgewo+ID4gVGhpcyBpc24ndCBHRU45IHNwZWNp
ZmljLCBzbyBjb3VsZCBiZSBjYWxsZWQgZGM2LWRwbXMtb2ZmLiBJIHN1cHBvc2UgeW91Cj4gPiBh
bHNvIHdhbnQgYSBkYzUtZHBtcy1vZmYgdGVzdC4KPgo+IEFTIG9uIEdlbjkswqAgKEkgYW0gc3Vy
ZSBhYm91dCBTS0wsIG5vdCBzdXJlIGFib3V0IG90aGVyIEdlbjkKPiBwbGF0Zm9ybXMpLCBvbiBT
S0wsIERDNiBpcyBhY2hpZXZlZCB3aXRoIERQTVMgb2ZmLiBidXQgb24gR2VuIDExLCBEQzYKPiBp
cyBhY2hpZXZlZCB3aXRoIFBTUi4KCkl0IG11c3QgYmUgYWxzbyBhY2hpZXZlZCB3aXRoIERQTVMg
b2ZmIGV2ZXJ5d2hlcmUgd2hlcmUgREM2IGlzCmF2YWlsYWJsZS4KCj4gVGhhdCdzIHdoeSBpIG5h
bWVkIHRlc3QgbGlrZSAiRGM2X3N0YXRlX29uX2dlbjkiIGFuZAo+ICJEYzZfc3RhdGVfb25fZ2Vu
MTEiLgoKTm8gbmVlZCB0byBoYXZlIHRoZSBwbGF0Zm9ybSBuYW1lIGluIHRoZSBzdWJ0ZXN0IG5h
bWUsIGxldCdzIGp1c3QgZG8gdGhlCnRlc3RzIGV2ZXJ5d2hlcmUgd2hlcmUgdGhlIGNvcnJlc3Bv
bmRpbmcgREMgY291bnRlciBpcyBhdmFpbGFibGUgYW5kCnNraXAgaXQgZWxzZXdoZXJlLgoKPiBB
bHNvIG9uIEdlbjksIERDNSBpcyBtYWlubHkgYWNoaWV2ZWQgd2l0aCBQU1IsIG9uIERQTVMgb2Zm
IGRpcmVjdGx5IHdlCj4gY2FuIGVudGVyIGludG8gREM2LgoKU3RpbGwsIGl0IG1ha2VzIHNlbnNl
IHRvIGhhdmUgYSBzZXBhcmF0ZSB0ZXN0IGZvciBEQzUsIHNvIHdlIGhhdmUgYQpiZXR0ZXIgY2x1
ZSB3aGF0IGdvZXMgd3JvbmcgaW4gY2FzZSBvZiBmYWlsdXJlcy4KCj4gU28gaW4gY2FzZSBvZiBE
UE1TIG9mZiBzY2VuYXJpbywgaSB3YXMgbWFpbmx5IGNoZWNraW5nIERjNiBjb3VudGVyLAo+IGlu
c3RlYWQgb2YgY2hlY2tpbmcgREM1IGFuZCBEYzYgY291bnRlcnMgYm90aC4KCkkgc3RpbGwgdGhp
bmsgd2Ugc2hvdWxkIGhhdmUgdGhlIGZvbGxvd2luZyBzdWJ0ZXN0czoKCmRjNS1wc3IKZGM2LXBz
cgpkYzUtZHBtcy1vZmYKZGM2LWRwbXMtb2ZmCgpBbmQgcnVuIGVhY2ggb2YgdGhlc2Ugd2hlcmUg
dGhlIGNvdW50ZXIgaXMgYXZhaWxhYmxlLCBza2lwIHRoZW0Kb3RoZXJ3aXNlLgoKPiA+IAo+ID4g
PiArCQlkYzVfZGM2X2NvdW50ZXJfYmVmb3JlX3N1c3BlbmQgPSByZWFkX2RjNV9kYzZfY291bnRl
cihkYXRhLmRldmlkKTsKPiA+ID4gKwkJZHBtc19vZmZfb24oJmRhdGEpOwo+ID4gPiArCQlkYzVf
ZGM2X2NvdW50ZXJfYWZ0ZXJfcmVzdW1lID0gcmVhZF9kYzVfZGM2X2NvdW50ZXIoZGF0YS5kZXZp
ZCk7Cj4gPiA+ICsJCWlndF9yZXF1aXJlX2YoZGM1X2RjNl9jb3VudGVyX2FmdGVyX3Jlc3VtZSA+
IGRjNV9kYzZfY291bnRlcl9iZWZvcmVfc3VzcGVuZCwKPiA+ID4gKwkJCQkiREM2IFN0YXRlIGlz
IG5vdCBhY2hpZXZlZFxuIik7Cj4gPiA+ICsJCWNsZWFudXAoJmRhdGEpOwo+ID4gPiArCX0KPiA+
ID4gICAJaWd0X2ZpeHR1cmUgewo+ID4gPiAgIAkJcHNyX2Rpc2FibGUoZGF0YS5kZWJ1Z2ZzX2Zk
KTsKPiA+ID4gICAJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7Cj4gPiA+IC0tIAo+ID4gPiAyLjcu
NAo+ID4gPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
