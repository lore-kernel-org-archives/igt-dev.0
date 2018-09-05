Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed,  5 Sep 2018 14:49:29 +0100
Message-Id: <20180905134939.2942-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
References: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] [PATH i-g-t 03/13] gem_wsim: Fix BCS usage under VCS2
 remap warning
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk5lZWQgdG8g
Y2hlY2sgd2UgYWN0dWFsbHkgYXJlIGluIFZDUzIgcmVtYXBwaW5nIG1vZGUhCgpTaWduZWQtb2Zm
LWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIGJlbmNo
bWFya3MvZ2VtX3dzaW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvZ2VtX3dzaW0uYyBiL2JlbmNo
bWFya3MvZ2VtX3dzaW0uYwppbmRleCA4MGYxODA4MjkyNDEuLjI1YWY0ZDY3OGJhNCAxMDA2NDQK
LS0tIGEvYmVuY2htYXJrcy9nZW1fd3NpbS5jCisrKyBiL2JlbmNobWFya3MvZ2VtX3dzaW0uYwpA
QCAtNTkyLDcgKzU5Miw3IEBAIGFkZF9zdGVwOgogCQl9CiAJfQogCi0JaWYgKGJjc191c2VkICYm
IHZlcmJvc2UpCisJaWYgKGJjc191c2VkICYmIChmbGFncyAmIFZDUzJSRU1BUCkgJiYgdmVyYm9z
ZSkKIAkJcHJpbnRmKCJCQ1MgdXNhZ2UgaW4gd29ya2xvYWQgd2l0aCBWQ1MyIHJlbWFwcGluZyBl
bmFibGVkIVxuIik7CiAKIAlyZXR1cm4gd3JrOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0Cklu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
