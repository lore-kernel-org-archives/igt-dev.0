Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BD910E03E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 11:02:09 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 14:02:05 +0300
Message-Id: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] meson: Disable testplan build by default
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No real idea what this "testplan" is and why it lives
in igt. Seems to be build some xe documentation, and based
on the name is maybe some manager level stuff? Surely
this is nothing that matters for normal people (esp. those
outside Intel).

The main problem here being that it is hideously slow to
build, making life miserable for everyone. Flip the
default to disabled and let those that need this enable
it themselves.

On my HSW:
$ touch tests/kms_color.c # any random file
$ time ninja -Cbuild
- real  0m22,202s
- user  0m20,640s
- sys   0m1,570s
+ real  0m0,241s
+ user  0m0,214s
+ sys   0m0,031s

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 meson_options.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson_options.txt b/meson_options.txt
index d4e373d6cfc4..0ea1383a4fe8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -22,6 +22,7 @@ option('man',
 
 option('testplan',
        type : 'feature',
+       value : 'disabled',
        description : 'Build testplan documentation pages in ReST and html')
 
 option('sphinx',
-- 
2.39.2
