Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A8E6E3B5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 07:35:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x4so1882105wmj.1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 00:35:16 -0700 (PDT)
References: <20200416172933.30533-1-juhapekka.heikkila@gmail.com>
 <20200416174225.GL6112@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <83c8e359-5c8a-7f29-a59d-4e53ad48a317@gmail.com>
Date: Fri, 17 Apr 2020 10:35:08 +0300
MIME-Version: 1.0
In-Reply-To: <20200416174225.GL6112@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Allow modeset to
 survive change of cdclk
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTYuNC4yMDIwIDIwLjQyLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTYsIDIwMjAgYXQgMDg6Mjk6MzNQTSArMDMwMCwgSnVoYS1QZWtrYSBIZWlra2lsYSB3cm90ZToK
Pj4gV2hlbiB0ZXN0aW5nIDY0YnBwIGZvcm1hdHMgdGhlcmUgd2lsbCBjb21lIG1vZGVzZXQgdG8g
Y2hhbmdlIGNkY2xrLgo+PiBBbGxvdyBtb2Rlc2V0cyBvbiBjb21taXRzIHNvIGNvbW1pdHMgd2ls
bCBub3QgcHJvZHVjZSBlcnJvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlr
a2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAgdGVzdHMva21z
X2JpZ19mYi5jIHwgNSArKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYmlnX2ZiLmMgYi90
ZXN0cy9rbXNfYmlnX2ZiLmMKPj4gaW5kZXggZWIxNDRkYTkuLmRhYmQxNmYzIDEwMDY0NAo+PiAt
LS0gYS90ZXN0cy9rbXNfYmlnX2ZiLmMKPj4gKysrIGIvdGVzdHMva21zX2JpZ19mYi5jCj4+IEBA
IC0yOTQsNiArMjk0LDcgQEAgc3RhdGljIGJvb2wgdGVzdF9wbGFuZShkYXRhX3QgKmRhdGEpCj4+
ICAgCQkgKi8KPj4gICAJCWlmIChpID09IDAgJiYgZGF0YS0+ZGlzcGxheS5pc19hdG9taWMgJiYK
Pj4gICAJCSAgICBpZ3RfZGlzcGxheV90cnlfY29tbWl0X2F0b21pYygmZGF0YS0+ZGlzcGxheSwK
Pj4gKwkJCQkJCSAgRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQgfAo+PiAgIAkJCQkJCSAg
RFJNX01PREVfQVRPTUlDX1RFU1RfT05MWSwKPj4gICAJCQkJCQkgIE5VTEwpICE9IDApIHsKPj4g
ICAJCQlpZiAoaWd0X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfUk9UQVRJT04pKQo+
PiBAQCAtMzE4LDggKzMxOSw4IEBAIHN0YXRpYyBib29sIHRlc3RfcGxhbmUoZGF0YV90ICpkYXRh
KQo+PiAgIAkJY29weV9wYXR0ZXJuKGRhdGEsIHNtYWxsX2ZiLCAwLCAwLCBiaWdfZmIsIHgsIHks
Cj4+ICAgCQkJICAgICBzbWFsbF9mYi0+d2lkdGgsIHNtYWxsX2ZiLT5oZWlnaHQpOwo+PiAgIAo+
PiAtCQlpZ3RfZGlzcGxheV9jb21taXQyKCZkYXRhLT5kaXNwbGF5LCBkYXRhLT5kaXNwbGF5Lmlz
X2F0b21pYyA/Cj4+IC0JCQkJICAgIENPTU1JVF9BVE9NSUMgOiBDT01NSVRfVU5JVkVSU0FMKTsK
Pj4gKwkJaWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgRFJNX01PREVfQVRPTUlD
X0FMTE9XX01PREVTRVQgfAo+IAo+IFRoYXQncyBub3QgaG93IHlvdSB1c2UgaWd0X2Rpc3BsYXlf
Y29tbWl0MigpLiBBbmQgaXQgYWxzbwo+IHBhc3NlcyBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9E
RVNFVCB0byBpZ3RfYXRvbWljX2NvbW1pdCgpLgoKWWVhLCBJJ2xsIGZpeCB0aGF0LiBTZWVtcyBp
dCB3YXMgdG9vIGxhdGUgaG91cnMgeWVzdGVyZGF5IG1ha2luZyB0aGF0IHBhdGNoLgoKPiAKPj4g
KwkJCQkgICAgZGF0YS0+ZGlzcGxheS5pc19hdG9taWMgPyBDT01NSVRfQVRPTUlDIDogQ09NTUlU
X1VOSVZFUlNBTCk7Cj4+ICAgCj4+ICAgCj4+ICAgCQlpZ3RfcGlwZV9jcmNfY29sbGVjdF9jcmMo
ZGF0YS0+cGlwZV9jcmMsICZzbWFsbF9jcmMpOwo+PiAtLSAKPj4gMi4yNi4wCj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGlndC1kZXYgbWFp
bGluZyBsaXN0Cj4+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
