Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9BB6EB7A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 15:37:14 +0000 (UTC)
References: <20190215004901.29158-1-antonio.argenziano@intel.com>
 <155023401407.19733.5462184837059514024@skylake-alporthouse-com>
Message-ID: <11b87cc5-0b53-6144-6860-47f3d4f55179@intel.com>
Date: Fri, 15 Feb 2019 07:37:13 -0800
MIME-Version: 1.0
In-Reply-To: <155023401407.19733.5462184837059514024@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915/gem_exec_schedule.c:
 Switch to gem_sync and gem_read
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Antonio Argenziano via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Antonio Argenziano <antonio.argenziano@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxNS8wMi8xOSAwNDozMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTE1IDAwOjQ5OjAxKQo+PiBAQCAtOTIzLDcgKzkyMSw3IEBA
IHN0YXRpYyB2b2lkIHdpZGUoaW50IGZkLCB1bnNpZ25lZCByaW5nKQo+PiAgICAgICAgICBJR1Rf
Q09SS19IQU5ETEUoY29yayk7Cj4+ICAgICAgICAgIHVpbnQzMl90IHBsdWc7Cj4+ICAgICAgICAg
IHVpbnQzMl90IHJlc3VsdDsKPj4gLSAgICAgICB1aW50MzJfdCAqcHRyOwo+PiArICAgICAgIHVp
bnQzMl90IHJlc3VsdF9yZWFkWzQqTUFYX0NPTlRFWFRTXTsKPiAKPiBPaCwgZGlkbid0IHNwb3Qg
dGhpcyB1bnRpbCBDSS4KPiB1aW50MzJfdCByZXN1bHRfcmVhZFtNQVhfQ09OVEVYVFNdCgpUaGFu
a3MsIGhvcGVmdWxseSB0aGUgbGFzdCBjb3V0LWJ5dGUgY29udmVyc2lvbiBJJ3ZlIG1pc3NlZC4K
CkFudG9uaW8KCj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
