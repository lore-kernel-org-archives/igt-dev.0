Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F803891E1
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 09:06:05 +0000 (UTC)
Date: Tue, 9 Apr 2019 12:06:02 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190409090602.GE22949@platvala-desk.ger.corp.intel.com>
References: <20190408213602.31554-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190408213602.31554-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Use nr_open not file-max for
 setting fd rlimit
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMTA6MzY6MDJQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFBldHJpIHBvaW50ZWQgb3V0IHRoYXQgdGhlIG1heGltdW0gYWxsb3dlZCBudW1iZXIg
b2YgZmlsZXMgcGVyIHByb2Nlc3MKPiBpcyBucl9vcGVuLCBub3QgdGhlIHN5c3RlbSBjYXAgb2Yg
ZmlsZS1tYXguCj4gCj4gU3VnZ2VzdGVkLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxh
QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KPiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5j
b20+Cj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgoKQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMDM1MQpS
ZXZpZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CgoKPiAt
LS0KPiAgbGliL2lndF9hdXguYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIv
aWd0X2F1eC5jCj4gaW5kZXggMjY2YWE4MzIxLi4wMmY0ZGVmYjYgMTAwNjQ0Cj4gLS0tIGEvbGli
L2lndF9hdXguYwo+ICsrKyBiL2xpYi9pZ3RfYXV4LmMKPiBAQCAtMTU5NSw3ICsxNTk1LDcgQEAg
Ym9vbCBpZ3RfYWxsb3dfdW5saW1pdGVkX2ZpbGVzKHZvaWQpCj4gIAlzdHJ1Y3QgcmxpbWl0IHJs
aW07Cj4gIAl1bnNpZ25lZCBub2ZpbGVfcmxpbSA9IDEwMjQqMTAyNDsKPiAgCj4gLQlGSUxFICpm
aWxlID0gZm9wZW4oIi9wcm9jL3N5cy9mcy9maWxlLW1heCIsICJyIik7Cj4gKwlGSUxFICpmaWxl
ID0gZm9wZW4oIi9wcm9jL3N5cy9mcy9ucl9vcGVuIiwgInIiKTsKPiAgCWlmIChmaWxlKSB7Cj4g
IAkJaWd0X2Fzc2VydChmc2NhbmYoZmlsZSwgIiV1IiwgJm5vZmlsZV9ybGltKSA9PSAxKTsKPiAg
CQlpZ3RfaW5mbygiU3lzdGVtIGxpbWl0IGZvciBvcGVuIGZpbGVzIGlzICV1XG4iLCBub2ZpbGVf
cmxpbSk7Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
