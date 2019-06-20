Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from cam-smtp0.cambridge.arm.com (unknown [217.140.106.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7976E427
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 12:43:10 +0000 (UTC)
From: Liviu Dudau <liviu.dudau@arm.com>
Date: Thu, 20 Jun 2019 13:42:54 +0100
Message-Id: <20190620124254.6736-1-liviu.dudau@arm.com>
In-Reply-To: <20190620080024.GA22949@platvala-desk.ger.corp.intel.com>
References: <20190620080024.GA22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] Add Arm drivers as supported drivers by
 igt.
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
To: IGT GPU Tool <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWRkIHRoZSBkcml2ZXJzIG1haW50YWluZWQgYnkgQXJtIGRldmVsb3BlcnMgdG8gdGhlIGlndC4K
CnYzOiBVcGRhdGUgdGhlIG1hbGktZHAgZHJpdmVyJ3MgbmFtZSB0byBtYXRjaCBrZXJuZWwgZHJp
dmVyIGNvZGUuCnYyOiBPcmRlciB0aGUgbW9kdWxlcyBhcnJheSBlbnRyaWVzIGFscGhhYmV0aWNh
bGx5LCBhcyBwZXIKICAgIFBldHJpIExhdHZhbGEncyBzdWdnZXN0aW9uLgoKU2lnbmVkLW9mZi1i
eTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5jb20+Ci0tLQogbGliL2RybXRlc3QuYyB8
IDMgKysrCiBsaWIvZHJtdGVzdC5oIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9kcm10ZXN0LmMgYi9saWIvZHJtdGVzdC5jCmluZGV4
IDI1ZjIwMzUzMC4uODI0MzI0N2EzIDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5jCisrKyBiL2xp
Yi9kcm10ZXN0LmMKQEAgLTIwNSw3ICsyMDUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtb2R1
bGUgewogCXZvaWQgKCptb2Rwcm9iZSkoY29uc3QgY2hhciAqbmFtZSk7CiB9IG1vZHVsZXNbXSA9
IHsKIAl7IERSSVZFUl9BTURHUFUsICJhbWRncHUiIH0sCisJeyBEUklWRVJfSERMQ0QsICJoZGxj
ZCIgfSwKIAl7IERSSVZFUl9JTlRFTCwgImk5MTUiLCBtb2Rwcm9iZV9pOTE1IH0sCisJeyBEUklW
RVJfS09NRURBLCAia29tZWRhIiB9LAorCXsgRFJJVkVSX01BTElEUCwgIm1hbGktZHAiIH0sCiAJ
eyBEUklWRVJfUEFORlJPU1QsICJwYW5mcm9zdCIgfSwKIAl7IERSSVZFUl9WM0QsICJ2M2QiIH0s
CiAJeyBEUklWRVJfVkM0LCAidmM0IiB9LApkaWZmIC0tZ2l0IGEvbGliL2RybXRlc3QuaCBiL2xp
Yi9kcm10ZXN0LmgKaW5kZXggNmM0YzM4OTljLi45NTJmMGM0YjYgMTAwNjQ0Ci0tLSBhL2xpYi9k
cm10ZXN0LmgKKysrIGIvbGliL2RybXRlc3QuaApAQCAtNDUsNiArNDUsMTAgQEAKICNkZWZpbmUg
RFJJVkVSX0FNREdQVQkoMSA8PCA0KQogI2RlZmluZSBEUklWRVJfVjNECSgxIDw8IDUpCiAjZGVm
aW5lIERSSVZFUl9QQU5GUk9TVAkoMSA8PCA2KQorI2RlZmluZSBEUklWRVJfSERMQ0QJKDEgPDwg
NykKKyNkZWZpbmUgRFJJVkVSX01BTElEUAkoMSA8PCA4KQorI2RlZmluZSBEUklWRVJfS09NRURB
CSgxIDw8IDkpCisKIC8qCiAgKiBFeGNsdWRlIERSVkVSX1ZHRU0gZnJvbSBEUklWRVJfQU5ZIHNp
bmNlIGlmIHlvdSBydW4gb24gYSBzeXN0ZW0KICAqIHdpdGggdmdlbSBhcyB3ZWxsIGFzIGEgc3Vw
cG9ydGVkIGRyaXZlciwgeW91IGNhbiBlbmQgdXAgd2l0aCBhCi0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
