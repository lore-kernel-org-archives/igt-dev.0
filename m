Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD72ACB19
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 16:35:12 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id o123so7679947vsc.3
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 09:35:12 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 13:35:05 -0300
Message-Id: <20220815163505.36380-1-tales.aparecida@gmail.com>
In-Reply-To: <20220815145146.24038-1-tales.aparecida@gmail.com>
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/4] CONTRIBUTING: Add reference for
 GTKDoc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tales Aparecida <tales.aparecida@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add reference links about code documentation.

Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---

Notes:
    resend to fix incomplete patchwork

 CONTRIBUTING.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 6d1294ad..1c50063a 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -13,6 +13,12 @@ The Code
 - The code should follow kernel coding style:
   https://www.kernel.org/doc/html/latest/process/coding-style.html
 
+- The in-code documentation should follow GtkDoc specifications:
+  https://developer-old.gnome.org/gtk-doc-manual/stable/documenting.html.
+  For an updated version, you can also download the GtkDoc's
+  [source code][gtkdoc-repo] and open its manual with `yelp` directly by typing
+  in a terminal: `yelp file:///absolute/path/to/gtk-doc/help/manual/C/index.docbook`
+
 - Testcases (subtests) have to use minus signs (-) as a word separator.
   The generated documentation contains glossary of commonly used terms.
 
@@ -30,6 +36,7 @@ The Code
   provided by the igt library. The semantic patch lib/igt.cocci can help with
   more automatic conversions.
 
+[gtkdoc-repo]: https://gitlab.gnome.org/GNOME/gtk-doc
 [igt-describe]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe
 
 
-- 
2.37.1
