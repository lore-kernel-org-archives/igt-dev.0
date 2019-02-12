Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45406E2A1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Feb 2019 14:14:50 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id b3so2350869ede.1
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Feb 2019 06:14:50 -0800 (PST)
Date: Tue, 12 Feb 2019 15:14:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190212141446.GB23159@phenom.ffwll.local>
References: <20190212135317.14057-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190212135317.14057-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] igt_command_line.sh: Abort if run as
 root
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTIsIDIwMTkgYXQgMDM6NTM6MTdQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHZpYSBpZ3QtZGV2IHdyb3RlOgo+IGBuaW5qYSB0ZXN0YCBpbnZva2VzIGlndF9jb21tYW5kX2xp
bmUuc2ggZm9yIGVhY2ggdGVzdCBiaW5hcnkgdG8gY2hlY2sKPiB0aGUgYmVoYXZpb3Igb2Ygc29t
ZSBvZiB0aGUgc3dpdGNoZXMuIE9uZSBvZiB0aGUgdmVyaWZpZWQgdGhpbmdzIGlzIHRoYXQKPiB0
aGUgdGVzdCBleGlzdHMgd2l0aCBub24temVybyBzdGF0dXMgd2hlbiByZXF1ZXN0aW5nIGludmFs
aWQgc3VidGVzdC4KPiAKPiBgLS1ydW4tc3VidGVzdGAgcmVzdWx0cyBpbiBpZ3RfZml4dHVyZXMg
YmVpbmcgZXhlY3V0ZWQgLSB0aGlzIGZpZGRsZXMKPiB3aXRoIHRoZSBkZXZpY2UgYW5kIHN5c2Zz
IGtub2JzLgo+IAo+IExldCdzIGV4aXQgZWFybHksIGlmIHdlIGFyZSByb290LCB0byBzYXZlIHBl
b3BsZSBmb3JtIHVuaW50ZW50aW9uYWwKPiBzaWRlLWVmZmVjdHMgYW5kIHN0cmFuZ2UgZmFpbHVy
ZXMuCj4gCj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENj
OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBcmth
ZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ln
dF9jb21tYW5kX2xpbmUuc2ggfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoIGIvdGVzdHMv
aWd0X2NvbW1hbmRfbGluZS5zaAo+IGluZGV4IGUwNWVjMzRjLi40MDhkOTY1ZiAxMDA3NTUKPiAt
LS0gYS90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCj4gKysrIGIvdGVzdHMvaWd0X2NvbW1hbmRf
bGluZS5zaAo+IEBAIC0xMDAsNiArMTAwLDEwIEBAIGNoZWNrX3Rlc3QgKCkKPiAgCS4vJHRlc3Qg
LS1ydW4tc3VidGVzdCBpbnZhbGlkLXN1YnRlc3QgPiAvZGV2L251bGwgMj4mMSAmJiBmYWlsICR0
ZXN0Cj4gIH0KPiAgCj4gK2lmIFsgIiRFVUlEIiAtZXEgMCBdOyB0aGVuCj4gKyAgICBmYWlsICJE
b24ndCBydW4gJDAgYXMgcm9vdC4gSXQgZXhlY3V0ZXMgaWd0X2ZpeHR1cmUgYmxvY2tzLiIKClJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiArZmkK
PiArCj4gIFRFU1RMSVNURklMRT0iJHRlc3RzX2Rpci90ZXN0LWxpc3QudHh0Igo+ICBpZiBbICEg
LXIgIiRURVNUTElTVEZJTEUiIF07IHRoZW4KPiAgCXRlc3RzX2Rpcj0idGVzdHMiCj4gLS0gCj4g
Mi4yMC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
