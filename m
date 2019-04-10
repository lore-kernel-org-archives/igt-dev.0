Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190410115703.rzt7m7atisajnf7f@ahiler-desk1.fi.intel.com>
References: <20190403222439.jidjcpw7ywd6eomz@smtp.gmail.com>
 <20190410112808.fhaezu5y5ozwreu4@ahiler-desk1.fi.intel.com>
 <155489604741.3516.10199806108580554496@skylake-alporthouse-com>
 <20190410115703.rzt7m7atisajnf7f@ahiler-desk1.fi.intel.com>
Message-ID: <155489759462.3516.5334794337864110689@skylake-alporthouse-com>
Date: Wed, 10 Apr 2019 12:59:54 +0100
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] lib: Rework __kms_addfb()
 function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTktMDQtMTAgMTI6NTc6MDMpCj4gT24gV2VkLCBB
cHIgMTAsIDIwMTkgYXQgMTI6MzQ6MDdQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTktMDQtMTAgMTI6Mjg6MDgpCj4gPiA+IE9uIFdl
ZCwgQXByIDAzLCAyMDE5IGF0IDA3OjI0OjM5UE0gLTAzMDAsIFJvZHJpZ28gU2lxdWVpcmEgd3Jv
dGU6Cj4gPiA+ID4gVGhlIGZ1bmN0aW9uIF9fa21zX2FkZGZiKCkgYW5kIGRybU1vZGVBZGRGQjJX
aXRoTW9kaWZpZXJzKCkgaGF2ZSBhCj4gPiA+ID4gc2ltaWxhciBjb2RlLiBEdWUgdG8gdGhpcyBz
aW1pbGFyaXR5LCB0aGlzIGNvbW1pdCByZXBsYWNlIHBhcnQgb2YgdGhlCj4gPiA+ID4gY29kZSBp
bnNpZGUgX19rbXNfYWRkZmIoKSBieSB1c2luZyBkcm1Nb2RlQWRkRkIyV2l0aE1vZGlmaWVycygp
Lgo+ID4gPiAKPiA+ID4gaWd0IG1hc3RlciAlIGdyZXAgJ15saWJkcm1fdmVyc2lvbicgbWVzb24u
YnVpbGQKPiA+ID4gbGliZHJtX3ZlcnNpb24gPSAnPj0yLjQuODInCj4gPiAKPiA+IFdoeSBpbnRy
b2R1Y2UgYSBkZXBlbmRlbmN5PyBUaGUgcHJpbWFyeSBwdXJwb3NlIG9mIGlndCBpcyBicmVha2lu
Zwo+ID4gaW9jdGxzLCBhbmQgdGhhdCB0eXBpY2FsbHkgcmVxdWlyZXMgYXZvaWRpbmcgYW55IHBy
b3RlY3RpdmUgbGlicmFyaWVzLgo+ID4gSW4gcGFydGljdWxhciwgd2Ugd2FudCB0byBiZSB2ZXJ5
LCB2ZXJ5IGNsZWFyIGFib3V0IHdoYXQgaWd0IGlzIGRvaW5nCj4gPiAoaW4gdGVybXMgb2Yga2Vy
bmVsIGFwaS9hYmkpIGFuZCBub3Qgb2JmdXNjYXRlLgo+ID4gLUNocmlzCj4gCj4gV2UgZGVwZW5k
IG9uIG9uZSBhZGRpdGlvbmFsIGNhbGwgZnJvbSBhIGxpYnJhcnkgdGhhdCB3ZSBhbHJlYWR5IHVz
ZQo+IHdpZGVseSBhY3Jvc3MgdGhlIHdob2xlIGNvZGViYXNlIGFuZCBpdCdzIHN0cmFpZ2h0IHVw
IGEgc2ltcGxlIHdyYXBwZXIuCj4gV2hpY2ggc2VlbXMgdG8gYmUgYSBwYXR0ZXJuIC0gd2UgdXMg
dGhvc2Ugc2ltcGxlIHdyYXBwZXIgd2hlcmUKPiBhdmFpbGFibGUsIGFuZCB3cml0ZSBvdXIgb3du
IGlmIHRoZXJlIGlzIG5vdGhpbmcgc3VpdGFibGUuCgpJIGNvbXBsZXRlbHkgZGlzYWdyZWUgd2l0
aCB0aGF0IGFzc2Vzc21lbnQsIGFuZCBkbyBub3QgdGhpbmsgd2Ugc2hvdWxkCnVuZGVybWluZSBp
Z3Qgc28gbGlnaHRseS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWdmeA==
