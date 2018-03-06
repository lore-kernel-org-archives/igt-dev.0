Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1C56E6A8
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 12:43:32 +0000 (UTC)
Received: by mail-wr0-x242.google.com with SMTP id o8so9284470wra.1
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Mar 2018 04:43:31 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue,  6 Mar 2018 12:43:10 +0000
Message-Id: <20180306124315.30208-7-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180306124315.30208-1-tvrtko.ursulin@linux.intel.com>
References: <20180306124315.30208-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 06/11] trace.pl: Move sortQueue near its user
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkp1c3QgdG8g
Y2xlYXIgdXAgc29tZSBzcGFjZSBmb3IgaW5jb21pbmcgY29kZSByZWZhY3RvcmluZy4KClNpZ25l
ZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CkNjOiBK
b2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvdHJh
Y2UucGwgfCAyMiArKysrKysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZS5w
bCBiL3NjcmlwdHMvdHJhY2UucGwKaW5kZXggNTA5ZGY2YzBkZDhiLi5kNDlkMjVkNmMxY2EgMTAw
NzU1Ci0tLSBhL3NjcmlwdHMvdHJhY2UucGwKKysrIGIvc2NyaXB0cy90cmFjZS5wbApAQCAtNTQ1
LDE3ICs1NDUsNiBAQCBzdWIgc29ydFN0YXJ0IHsKIAlyZXR1cm4gJHZhbDsKIH0KIAotc3ViIHNv
cnRRdWV1ZSB7Ci0JbXkgJGFzID0gJGRieyRhfS0+eydxdWV1ZSd9OwotCW15ICRicyA9ICRkYnsk
Yn0tPnsncXVldWUnfTsKLQlteSAkdmFsOwotCi0JJHZhbCA9ICRhcyA8PT4gJGJzOwotCSR2YWwg
PSAkYSBjbXAgJGIgaWYgJHZhbCA9PSAwOwotCi0JcmV0dXJuICR2YWw7Ci19Ci0KIG15IEBzb3J0
ZWRfa2V5cyA9IHNvcnQgc29ydFN0YXJ0IGtleXMgJWRiOwogbXkgJHJlX3NvcnQgPSAwOwogCkBA
IC04NTksNiArODQ4LDE3IEBAIHByaW50IDw8RU5ESFRNTDsKICAgdmFyIGl0ZW1zID0gbmV3IHZp
cy5EYXRhU2V0KFsKIEVOREhUTUwKIAorc3ViIHNvcnRRdWV1ZSB7CisJbXkgJGFzID0gJGRieyRh
fS0+eydxdWV1ZSd9OworCW15ICRicyA9ICRkYnskYn0tPnsncXVldWUnfTsKKwlteSAkdmFsOwor
CisJJHZhbCA9ICRhcyA8PT4gJGJzOworCSR2YWwgPSAkYSBjbXAgJGIgaWYgJHZhbCA9PSAwOwor
CisJcmV0dXJuICR2YWw7Cit9CisKIG15ICRpID0gMDsKIGZvcmVhY2ggbXkgJGtleSAoc29ydCBz
b3J0UXVldWUga2V5cyAlZGIpIHsKIAlteSAoJG5hbWUsICRjdHgsICRzZXFubykgPSAoJGRieyRr
ZXl9LT57J25hbWUnfSwgJGRieyRrZXl9LT57J2N0eCd9LCAkZGJ7JGtleX0tPnsnc2Vxbm8nfSk7
Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
