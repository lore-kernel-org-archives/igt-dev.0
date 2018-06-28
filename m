Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DDB6E4B8
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jun 2018 09:29:41 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20180625071006.12736-1-arkadiusz.hiler@intel.com>
References: <20180621110625.14201-2-petri.latvala@intel.com>
 <20180625071006.12736-1-arkadiusz.hiler@intel.com>
Date: Thu, 28 Jun 2018 12:29:27 +0300
Message-ID: <87zhzfs1hk.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] meson: Add options to control
 optional parts
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matt Turner <mattst88@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyNSBKdW4gMjAxOCwgQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50
ZWwuY29tPiB3cm90ZToKPiBGcm9tOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVs
LmNvbT4KPgo+IERpc3RyaWJ1dGlvbnMgd2FudCBleHBsaWNpdCBjb250cm9sIG92ZXIgb3B0aW9u
YWwgcGFydHMgc28gdGhleSBjYW4KPiBzdGF0ZSBydW50aW1lIGRlcGVuZGVuY2llcyBiZWZvcmUg
YnVpbGRpbmcuIExldCdzIHJlc3RvcmUgdGhlCj4gZnVuY3Rpb25hbGl0eSBhdXRvdG9vbHMgdXNl
ZCB0byBwcm92aWRlLgo+Cj4gV2hlcmUgcG9zc2libGUsIHRoZSBzZWxlY3Rpb24gaXMgZG9uZSBi
eSBjaG9vc2luZyB3aGV0aGVyIHRvIGJ1aWxkIGEKPiBwYXJ0aWN1bGFyIGl0ZW0gYW5kIHRoZSBv
cHRpb24gbmFtZSBpcyBidWlsZF8kaXRlbS4gRXhhbXBsZToKPiBidWlsZF9vdmVybGF5LiBXaGVy
ZSBub3QgcG9zc2libGUsIHRoZSBvcHRpb24gbmFtZSBpcwo+IHdpdGhfJGl0ZW0uIEV4YW1wbGU6
IHdpdGhfdmFsZ3JpbmQuCj4KPiBBcnJheSBvcHRpb25zIHJlcXVpcmUgYSBidW1wIG9mIHJlcXVp
cmVkIG1lc29uIHZlcnNpb24gdG8gMC40NC4gRGViaWFuCj4gc3RhYmxlIGhhcyBtZXNvbiAwLjM3
IHdoaWNoIGlzIGFscmVhZHkgdG9vIG9sZCwgc3RhYmxlLWJhY2twb3J0cyBoYXMKPiAwLjQ1LCBD
SSB1c2VzIDAuNDUuIE1lc2EncyBtZXNvbiByZXF1aXJlbWVudCBpcyAwLjQ0LjEsIGZvciBhCj4g
cGVyc3BlY3RpdmUuCgpJJ20gZmluZSB3aXRoIHRoZSBtZXNvbiB2ZXJzaW9uIHJlcXVpcmVtZW50
LiBIb3dldmVyLCBmb3Igc29tZSByZWFzb24KdGhlIG1lc29uX3ZlcnNpb24gOiAnPjAuNDQuMCcg
ZG9lc24ndCB0YWtlIGVmZmVjdCBmb3IgbWVzb25fb3B0aW9ucy50eHQ6CgoiIiIKJCBybSAtcmYg
YnVpbGQ7IG1lc29uIGJ1aWxkClRoZSBNZXNvbiBidWlsZCBzeXN0ZW0KVmVyc2lvbjogMC40Mi4x
ClNvdXJjZSBkaXI6IC9ob21lL2phbmkvc3JjL2ludGVsLWdwdS10b29scwpCdWlsZCBkaXI6IC9o
b21lL2phbmkvc3JjL2ludGVsLWdwdS10b29scy9idWlsZApCdWlsZCB0eXBlOiBuYXRpdmUgYnVp
bGQKCk1lc29uIGVuY291bnRlcmVkIGFuIGVycm9yIGluIGZpbGUgbWVzb25fb3B0aW9ucy50eHQs
IGxpbmUgNywgY29sdW1uIDA6ClVua25vd24gdHlwZSBhcnJheS4KIiIiCgpJIGNhbiBvYnZpb3Vz
bHkganVzdCB1cGRhdGUgbWVzb24gbm93IHRoYXQgSSBmaWd1cmVkIGl0IG91dCwgYnV0IGlzCnRo
ZXJlIHNvbWV0aGluZyB3ZSBjb3VsZCBkbyB0byBiZSBtb3JlIGhlbHBmdWwgZm9yIHRoZSBuZXh0
IHBlcnNvbgpoaXR0aW5nIHRoaXM/CgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVs
IE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
