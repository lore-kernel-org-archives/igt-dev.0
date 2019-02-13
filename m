Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D506E71C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 12:06:57 +0000 (UTC)
References: <20190212171134.15452-1-maarten.lankhorst@linux.intel.com>
 <20190212171134.15452-2-maarten.lankhorst@linux.intel.com>
Message-ID: <44477e99-8118-cbee-a317-3950f1bca065@linux.intel.com>
Date: Wed, 13 Feb 2019 13:06:55 +0100
MIME-Version: 1.0
In-Reply-To: <20190212171134.15452-2-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: Add support for P01x
 formats, v5.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Maarten Lankhorst via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTItMDItMjAxOSBvbSAxODoxMSBzY2hyZWVmIE1hYXJ0ZW4gTGFua2hvcnN0Ogo+IFRoZSBQ
MDF4IGZvcm1hdHMgYXJlIHBsYW5hciAxNiBiaXRzIHBlciBjb21wb25lbnQsIHdpdGggdGhlIHVu
dXNlZCBsb3dlciBiaXRzIHNldCB0byAwLgo+IFRoaXMgbWVhbnMgdGhleSBjYW4gYWxsIGJlIGNv
bnZlcnRlZCB0aGUgc2FtZSB3YXkuIE9ubHkgdGhlIHJhbmdlIGlzIHNsaWdodGx5IGRpZmZlcmVu
dCwKPiBhbmQgdGhpcyBpcyBoYW5kbGVkIGluIHRoZSBjb2xvcl9lbmNvZGluZyBpbXBsZW1lbnRh
dGlvbi4KPgo+IFRoaXMgcmVxdWlyZXMgY2Fpcm8gMS4xNy4yIGFuZCBwaXhtYW4gMC4zNi4gVGhp
cyB3b3JrcyBidXQgZG9lc24ndCBnaXZlIGV4dHJhIHByZWNpc2lvbi4KPiBGb3IgbW9yZSB0aGFu
IDggYml0cyBwcmVjaXNpb24gYSBmZXcgbW9yZSBwYXRjaGVzIGFyZSByZXF1aXJlZCB0byBwaXht
YW4sIHBlbmRpbmcgcmV2aWV3Ogo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hp
dmVzL3BpeG1hbi8yMDE5LUphbnVhcnkvMDA0ODE1Lmh0bWwKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9hcmNoaXZlcy9waXhtYW4vMjAxOS1KYW51YXJ5LzAwNDgwOS5odG1sCj4KPiBP
bmNlIHRob3NlIGFyZSBtZXJnZWQsIHdlIHdpbGwgcmVxdWlyZSB0aGUgbmV4dCBwaXhtYW4gcmVs
ZWFzZSBmb3IgYmV0dGVyIHByZWNpc2lvbi4KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBBZGQg
ZmFsbGJhY2sgY29sb3IgZGVmaW5pdGlvbnMgd2hlbiBjb21waWxpbmcgb24gY2Fpcm8gdmVyc2lv
biA8IDEuMTcuMi4KPiAtIFNraXAgd2hlbiBGQiBjcmVhdGlvbiBmYWlscyBvbiBIRFIgZm9ybWF0
cywgaW5zdGVhZCBvZiBmYWlsaW5nLgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gLSBDb21wbGFpbiBz
bGlnaHRseSBoYXJkZXIgd2hlbiBwaXhtYW4vY2Fpcm8gYXJlIG91dCBvZiBkYXRlLgo+IC0gQ3Jl
YXRlIGEgZmIgd2l0aCBhbHBoYSB3aGVuIGNvbnZlcnRpbmcgdG8gcGl4bWFuIGZvcm1hdHMgd2l0
aCBhbHBoYS4KPiAtIE9vcHMsIHMvcGl4bWFuX2Zvcm1hdF9jb2RlX3QvY2Fpcm9fZm9ybWF0X3Qv
Cj4gQ2hhbmdlcyBzaW5jZSB2MzoKPiAtIFJlYmFzZSBvbiB0b3Agb2YgdXBzdHJlYW0gWVVWIGNo
YW5nZXMuCj4gQ2hhbmdlcyBzaW5jZSB2NDoKPiAtIFJlYmFzZSBhZ2Fpbi4KPiAtIFVzZSBkcm1f
Zm91cmNjLmggZnJvbSBkcm0tbWlzYy1uZXh0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBM
YW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1i
eTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4gICN2
NAoKCkNJIGlzIGhhcHB5LCBwdXNoZWQuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
