Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAD456E6E7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Dec 2018 09:18:12 +0000 (UTC)
Message-ID: <4c9bfb4cdbc8818335ea88a7cf9a7f718f0df448.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 07 Dec 2018 10:18:01 +0100
In-Reply-To: <20181204102509.18401-9-maxime.ripard@bootlin.com>
References: <20181204102509.18401-1-maxime.ripard@bootlin.com>
 <20181204102509.18401-9-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH RESEND i-g-t 8/8] igt: tests: chamelium: Add
 NV12 format
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDIwMTgtMTItMDQgYXQgMTE6MjUgKzAxMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gVGhlIE5WMTIgaXMgYSBZVVYgZm9ybWF0IHRoYXQgYXJlIGN1cnJlbnRseSBzdXBwb3J0
ZWQgaW4gSUdULgo+IAo+IFdlJ2xsIHdhbnQgdG8gdGVzdCB0aG9zZSBmb3JtYXRzIGluIGFkZGl0
aW9uIHRvIHRoZSBSR0IgZm9ybWF0cywgc28KPiBsZXQncyBhZGQgc29tZSBzdWJ0ZXN0cy4gT25l
IHRoaW5nIHdvcnRoIG5vdGluZyBpcyBzb21lIGhhcmR3YXJlIGlzbid0Cj4gYWJsZSB0byBvdXRw
dXQgYSBwaXhlbC1wZXJmZWN0IGltYWdlLCBzbyB3ZSBkbyB0aGUgc2FtZSBraW5kIG9mCj4gY29t
cGFyaXNvbiB0aGFuIGZvciBWR0EuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiAtLS0KPiAgdGVzdHMva21zX2NoYW1lbGl1bS5j
IHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX2NoYW1lbGl1bS5jIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCj4gaW5k
ZXggODBiMjc5YzRmMWMyLi44YTlmNmJmZTkyMzUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2No
YW1lbGl1bS5jCj4gKysrIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCj4gQEAgLTk3Niw2ICs5NzYs
MTAgQEAgaWd0X21haW4KPiAgCQkJdGVzdF9kaXNwbGF5X29uZV9tb2RlKCZkYXRhLCBwb3J0LCBE
Uk1fRk9STUFUX1hSR0IxNTU1LAo+ICAJCQkJCSAgICAgIENIQU1FTElVTV9DSEVDS19DUkMsIDEp
Owo+ICAKPiArCQljb25uZWN0b3Jfc3VidGVzdCgiaGRtaS1jcmMtbnYxMiIsIEhETUlBKQoKV2Vs
bCwgc2luY2UgdGhlIHRlc3QgZG9lcyBub3QgcmVseSBvbiBhIENSQyBidXQgb24gYW4gZXJyb3It
dHJlbmQKY29tcGFyaXNvbiwgbWF5YmUgaXQgc2hvdWxkIGJlIG5hbWVkIGRpZmZlcmVudGx5PwoK
Q2hlZXJzLAoKUGF1bAoKPiArCQkJdGVzdF9kaXNwbGF5X29uZV9tb2RlKCZkYXRhLCBwb3J0LCBE
Uk1fRk9STUFUX05WMTIsCj4gKwkJCQkJICAgICAgQ0hBTUVMSVVNX0NIRUNLX0FOQUxPRywgMSk7
Cj4gKwo+ICAJCWNvbm5lY3Rvcl9zdWJ0ZXN0KCJoZG1pLWZyYW1lLWR1bXAiLCBIRE1JQSkKPiAg
CQkJdGVzdF9kaXNwbGF5X2ZyYW1lX2R1bXAoJmRhdGEsIHBvcnQpOwo+ICAJfQotLSAKUGF1bCBL
b2NpYWxrb3dza2ksIEJvb3RsaW4gKGZvcm1lcmx5IEZyZWUgRWxlY3Ryb25zKQpFbWJlZGRlZCBM
aW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
