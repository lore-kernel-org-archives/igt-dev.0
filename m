Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed,  5 Sep 2018 14:49:36 +0100
Message-Id: <20180905134939.2942-11-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
References: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] [PATH i-g-t 10/13] media-bench: Protect against
 incorrect -b syntax
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCi1iIGlzIHRv
IHBhc3MgdGhlIGNvbW1hbmQgYXJndW1lbnQgZGlyZWN0bHkgdG8gZ2VtX3dzaW0gc28gbXVzdCBp
bmNsdWRlCmFub3RoZXIgLWIuCgpTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHNjcmlwdHMvbWVkaWEtYmVuY2gucGwgfCA1ICsrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvc2NyaXB0cy9tZWRpYS1iZW5jaC5wbCBiL3NjcmlwdHMvbWVkaWEtYmVuY2gucGwKaW5k
ZXggYTM2MTljZWIzNGNjLi41MDcwY2FlMDg4ZjMgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvbWVkaWEt
YmVuY2gucGwKKysrIGIvc2NyaXB0cy9tZWRpYS1iZW5jaC5wbApAQCAtMzQxLDcgKzM0MSwxMCBA
QCBFTkRIRUxQCiAkdmVyYm9zZSA9IDEgaWYgZGVmaW5lZCAkb3B0c3sndid9OwogJGd0MiA9IDEg
aWYgZGVmaW5lZCAkb3B0c3snMid9OwogJHNob3dfY21kcyA9IDEgaWYgZGVmaW5lZCAkb3B0c3sn
eCd9OwotJGJhbGFuY2VyID0gJG9wdHN7J2InfSBpZiBkZWZpbmVkICRvcHRzeydiJ307CitpZiAo
ZGVmaW5lZCAkb3B0c3snYid9KSB7CisJZGllIHVubGVzcyBzdWJzdHIoJG9wdHN7J2InfSwgMCwg
MikgZXEgJy1iJzsKKwkkYmFsYW5jZXIgPSAkb3B0c3snYid9OworfQogaWYgKGRlZmluZWQgJG9w
dHN7J0InfSkgewogCUBiYWxhbmNlcnMgPSBzcGxpdCAvLC8sICRvcHRzeydCJ307CiB9IGVsc2Ug
ewotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
ZngK
