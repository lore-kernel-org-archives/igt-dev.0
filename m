Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC6C6EFCF
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:02 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:45 +0200
Message-Id: <20190116112050.27647-17-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 16/21] lib/igt_core: Assert that optarg is
 present
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgZ2V0b3B0X2xvbmcgaXMgdG9sZCBhbiBhcmd1bWVudCBpcyByZXF1aXJlZCwgaXQgd2lsbCBn
aXZlIGl0LgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRl
bC5jb20+CkNjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0t
LQogbGliL2lndF9jb3JlLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9jb3JlLmMKaW5kZXggN2M3Mjdl
ZGMuLjI2ZGQyNzg5IDEwMDY0NAotLS0gYS9saWIvaWd0X2NvcmUuYworKysgYi9saWIvaWd0X2Nv
cmUuYwpAQCAtNzYwLDYgKzc2MCw3IEBAIHN0YXRpYyBpbnQgY29tbW9uX2luaXQoaW50ICphcmdj
LCBjaGFyICoqYXJndiwKIAkJCQlsaXN0X3N1YnRlc3RzID0gdHJ1ZTsKIAkJCWJyZWFrOwogCQlj
YXNlIE9QVF9SVU5fU1VCVEVTVDoKKwkJCWFzc2VydChvcHRhcmcpOwogCQkJaWYgKCFsaXN0X3N1
YnRlc3RzKQogCQkJCXJ1bl9zaW5nbGVfc3VidGVzdCA9IHN0cmR1cChvcHRhcmcpOwogCQkJYnJl
YWs7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
