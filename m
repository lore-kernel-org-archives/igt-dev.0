Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D409B6E16E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 22:35:42 +0000 (UTC)
Message-ID: <6475bd683dc97972715cbc1c48996ef212cc5ffb.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 14 Mar 2019 15:35:39 -0700
In-Reply-To: <20190314110305.28903-1-arkadiusz.hiler@intel.com>
References: <20190314110305.28903-1-arkadiusz.hiler@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane: Print count of
 mismatched colors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTAzLTE0IGF0IDEzOjAzICswMjAwLCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6
Cj4gQ3VycmVudGx5IHdlIGFyZSBwcmludGluZyBvbmUgaWd0X3dhcm4gZm9yIGVhY2ggQ1JDIG1p
c21hdGNoLCB3aGljaAo+IGdldHMKPiBxdWl0ZSBvdmVyd2hlbG1pbmcgd2l0aCBoYXZpbmcgdG8g
c2VlIHRoZSBzYW1lIGVycm9yIDggdGltZXMgZm9yIGVhY2gKPiBjb2xvciB0ZXN0ZWQ6Cj4gCj4g
V0FSTklORzogQ1JDIG1pc21hdGNoIHdpdGggZm9ybWF0IE5WMTIgKDB4MzIzMTU2NGUpIG9uIEEu
Mwo+IFdBUk5JTkc6IENSQyBtaXNtYXRjaCB3aXRoIGZvcm1hdCBOVjEyICgweDMyMzE1NjRlKSBv
biBBLjMKPiBXQVJOSU5HOiBDUkMgbWlzbWF0Y2ggd2l0aCBmb3JtYXQgTlYxMiAoMHgzMjMxNTY0
ZSkgb24gQS4zCj4gV0FSTklORzogQ1JDIG1pc21hdGNoIHdpdGggZm9ybWF0IE5WMTIgKDB4MzIz
MTU2NGUpIG9uIEEuMwo+IFdBUk5JTkc6IENSQyBtaXNtYXRjaCB3aXRoIGZvcm1hdCBOVjEyICgw
eDMyMzE1NjRlKSBvbiBBLjMKPiBXQVJOSU5HOiBDUkMgbWlzbWF0Y2ggd2l0aCBmb3JtYXQgTlYx
MiAoMHgzMjMxNTY0ZSkgb24gQS4zCj4gV0FSTklORzogQ1JDIG1pc21hdGNoIHdpdGggZm9ybWF0
IE5WMTIgKDB4MzIzMTU2NGUpIG9uIEEuMwo+IFdBUk5JTkc6IENSQyBtaXNtYXRjaCB3aXRoIGZv
cm1hdCBOVjEyICgweDMyMzE1NjRlKSBvbiBBLjMKPiAKPiBTaW5jZSB0aGUgbW9zdCBpbnRlcmVz
dGluZyBpbmZvcm1hdGlvbiBoZXJlIGlzIHdoaWNoIGZvcm1hdCBvbiB3aGljaAo+IHBpcGUvcGxh
bmUgaXMgYnJva2VuIHdlIGNhbiBza2lwIGlndF93YXJuIGp1c3Qgb25jZS4KPiAKPiBGb3IgdGhv
c2Ugd2VpcmRlciBhbmQgcmFyZXIgY2FzZSB3aGVyZSBqdXN0IGNlcnRhaW4gY29sb3JzIHdvdWxk
IGZhaWwKPiB3ZQo+IHN0aWxsIHByb3ZpZGUgdGhlIGNvdW50OgpJTU8gaXQncyBiZXR0ZXIgdG8g
aGF2ZSBhbGwgdGhlIGluZm9ybWF0aW9uIGluIHRoZSBsb2dzLCBwYXJ0aWN1bGFybHkKZm9yIHRo
b3NlICd3ZWlyZGVyIGFuZCByYXJlIGNhc2VzLCB3aGljaCBhcmUgaGFyZCB0byByZXByb2R1Y2Uu
IEFuZApkb24ndCBzZWUgaG93IGNvdW50IGlzIHVzZWZ1bC4gSSB0aGluaywgd2Ugc2hvdWxkIGJl
IGV2ZW4gbG9nZ2luZyB0aGUKUkdCIHZhbHVlcyBmb3IgdGhlIG1pc21hdGNoaW5nIGNhc2VzLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
