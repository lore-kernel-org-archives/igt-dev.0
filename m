Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96476E40F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 19:01:15 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
Date: Fri,  8 Mar 2019 21:01:07 +0200
Message-Id: <20190308190107.32514-2-jani.nikula@intel.com>
In-Reply-To: <20190308190107.32514-1-jani.nikula@intel.com>
References: <20190308190107.32514-1-jani.nikula@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/intel_vbt_decode: check
 inconsistent sequence element size
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
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Q3Jvc3MgY2hlY2sgYWdhaW5zdCB0aGUgZWxlbWVudCBkdW1wZXIgcmV0dXJuIHZhbHVlIHRvIGNh
dGNoCmluY29uc2lzdGVuY2llcy4KClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBpbnRlbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jIHwgNiArKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9pbnRl
bF92YnRfZGVjb2RlLmMgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKaW5kZXggZGU0Y2M4OGEw
NmRkLi41ZjNkYjgwOGQ3MGQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2ludGVsX3ZidF9kZWNvZGUuYwor
KysgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKQEAgLTEyODksNyArMTI4OSwxMyBAQCBzdGF0
aWMgY29uc3QgdWludDhfdCAqZHVtcF9zZXF1ZW5jZShjb25zdCB1aW50OF90ICpkYXRhLCB1aW50
OF90IHNlcV92ZXJzaW9uKQogCQkJb3BlcmF0aW9uX3NpemUgPSAqZGF0YSsrOwogCiAJCWlmICht
aXBpX2VsZW1fZHVtcCkgeworCQkJY29uc3QgdWludDhfdCAqbmV4dCA9IGRhdGEgKyBvcGVyYXRp
b25fc2l6ZTsKKwogCQkJZGF0YSA9IG1pcGlfZWxlbV9kdW1wKGRhdGEsIHNlcV92ZXJzaW9uKTsK
KworCQkJaWYgKG9wZXJhdGlvbl9zaXplICYmIG5leHQgIT0gZGF0YSkKKwkJCQlwcmludGYoIkVy
cm9yOiBJbmNvbnNpc3RlbnQgb3BlcmF0aW9uIHNpemU6ICVkXG4iLAorCQkJCQlvcGVyYXRpb25f
c2l6ZSk7CiAJCX0gZWxzZSBpZiAob3BlcmF0aW9uX3NpemUpIHsKIAkJCS8qIFdlIGhhdmUgc2l6
ZSwgc2tpcC4gKi8KIAkJCWRhdGEgKz0gb3BlcmF0aW9uX3NpemU7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
