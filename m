Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AC86E0AA
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2019 10:52:01 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 29 May 2019 13:51:49 +0300
Message-Id: <20190529105150.19050-2-petri.latvala@intel.com>
In-Reply-To: <20190529105150.19050-1-petri.latvala@intel.com>
References: <20190529105150.19050-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] meson: Mark pciaccess and kmod as
 required
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

bGlicGNpYWNjZXNzIGFuZCBsaWJrbW9kIGhhdmUgYmVlbiBtYW5kYXRvcnkgYWxyZWFkeSwgYnV0
IG5vdCBtYXJrZWQKYXMgcmVxdWlyZWQuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxw
ZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6Lmhp
bGVyQGludGVsLmNvbT4KQ2M6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KLS0tCiBt
ZXNvbi5idWlsZCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4
IDYyNjhjNThkLi4zMzZjZTRlNiAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24u
YnVpbGQKQEAgLTExNCw4ICsxMTQsOCBAQCBlbmRpZgogCiBidWlsZF9pbmZvICs9ICdXaXRoIGxp
YmRybTogJyArICcsJy5qb2luKGxpYmRybV9pbmZvKQogCi1wY2lhY2Nlc3MgPSBkZXBlbmRlbmN5
KCdwY2lhY2Nlc3MnLCB2ZXJzaW9uIDogJz49MC4xMCcpCi1saWJrbW9kID0gZGVwZW5kZW5jeSgn
bGlia21vZCcpCitwY2lhY2Nlc3MgPSBkZXBlbmRlbmN5KCdwY2lhY2Nlc3MnLCB2ZXJzaW9uIDog
Jz49MC4xMCcsIHJlcXVpcmVkIDogdHJ1ZSkKK2xpYmttb2QgPSBkZXBlbmRlbmN5KCdsaWJrbW9k
JywgcmVxdWlyZWQgOiB0cnVlKQogbGlicHJvY3BzID0gZGVwZW5kZW5jeSgnbGlicHJvY3BzJywg
cmVxdWlyZWQgOiB0cnVlKQogCiBsaWJ1bndpbmQgPSBkZXBlbmRlbmN5KCdsaWJ1bndpbmQnLCBy
ZXF1aXJlZCA6IGdldF9vcHRpb24oJ3dpdGhfbGlidW53aW5kJykpCi0tIAoyLjE5LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
