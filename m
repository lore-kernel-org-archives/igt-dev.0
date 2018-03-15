Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0946E013
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 11:45:18 +0000 (UTC)
Date: Thu, 15 Mar 2018 13:44:51 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180315114451.vajxnphljiqrqsl6@platvala-desk.ger.corp.intel.com>
References: <20180315005910.18808-1-lucas.demarchi@intel.com>
 <20180315005910.18808-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180315005910.18808-3-lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] run-tests.sh: allow relative
 IGT_TEST_ROOT and IGT_CONFIG_PATH
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
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDU6NTk6MDhQTSAtMDcwMCwgTHVjYXMgRGUgTWFyY2hp
IHdyb3RlOgo+IFdoZW4gcGlnbGl0IHJ1bnMgaXQgY2hkaXIoKSB0byBpdHMgb3duIGRpcmVjdG9y
eSwgc28gcGFzc2luZyBhIHJlbGF0aXZlCj4gcGF0aCBkb2Vzbid0IHdvcmsuIEUuZy46Cj4gCj4g
CUZhdGFsIEVycm9yOiBJR1QgZGlyZWN0b3J5IGRvZXMgbm90IGV4aXN0LiBNaXNzaW5nOiBidWls
ZC90ZXN0cwo+IAo+IE1ha2Ugc3VyZSBwYXRoIGlzIGFic29sdXRlIHRocm91Z2hvdXQgdGhlIHNj
cmlwdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hp
QGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGlu
dGVsLmNvbT4KCgo+IC0tLQo+ICBzY3JpcHRzL3J1bi10ZXN0cy5zaCB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9zY3JpcHRzL3J1bi10ZXN0cy5zaCBiL3NjcmlwdHMvcnVuLXRlc3RzLnNoCj4gaW5kZXgg
MWMzZjI4MDUuLjIzMDI1MGRkIDEwMDc1NQo+IC0tLSBhL3NjcmlwdHMvcnVuLXRlc3RzLnNoCj4g
KysrIGIvc2NyaXB0cy9ydW4tdGVzdHMuc2gKPiBAQCAtMjQsOCArMjQsOCBAQAo+ICAKPiAgUk9P
VD0iYGRpcm5hbWUgJDBgIgo+ICBST09UPSJgcmVhZGxpbmsgLWYgJFJPT1QvLi5gIgo+IC1JR1Rf
VEVTVF9ST09UPSIke0lHVF9URVNUX1JPT1Q6LSRST09UL3Rlc3RzfSIKPiAtSUdUX0NPTkZJR19Q
QVRIPSIke0lHVF9DT05GSUdfUEFUSDotJEhPTUUvLmlndHJjfSIKPiArSUdUX1RFU1RfUk9PVD0i
YHJlYWRsaW5rIC1mICR7SUdUX1RFU1RfUk9PVDotJFJPT1QvdGVzdHN9YCIKPiArSUdUX0NPTkZJ
R19QQVRIPSJgcmVhZGxpbmsgLWYgJHtJR1RfQ09ORklHX1BBVEg6LSRIT01FLy5pZ3RyY31gIgo+
ICBSRVNVTFRTPSIkUk9PVC9yZXN1bHRzIgo+ICBQSUdMSVQ9YHdoaWNoIHBpZ2xpdCAyPiAvZGV2
L251bGxgCj4gIAo+IC0tIAo+IDIuMTQuMwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
