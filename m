Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FE96E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 18:02:34 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 11 Aug 2021 11:02:17 -0700
Message-Id: <20210811180217.91142-2-lucas.demarchi@intel.com>
In-Reply-To: <20210811180217.91142-1-lucas.demarchi@intel.com>
References: <20210811180217.91142-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_edid: fix string padding
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com, Simon Ser <contact@emersion.fr>
List-ID: <igt-dev@lists.freedesktop.org>

While checking a fix for the warning

	[2/390] Compiling C object lib/libigt-igt_edid_c.a.p/igt_edid.c.o
	In file included from /usr/include/string.h:519,
			 from ../lib/igt_edid.c:29:
	In function ‘strncpy’,
	    inlined from ‘detailed_timing_set_string’ at ../lib/igt_edid.c:186:2:
	/usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:10: warning: ‘__builtin_strncpy’ specified bound 13 equals destination size [-Wstringop-truncation]
	   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
	      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	   96 |       __glibc_objsize (__dest));
	      |       ~~~~~~~~~~~~~~~~~~~~~~~~~

... I noticed we were not following the spec to the letter.
According to EDID 1.3 data format, EDID Other Monitor Descriptors has the this
information for bytes 5-17: "Defined by descriptor type. If text, code page 437
text, terminated (if less than 13 bytes) with LF and padded with SP."
So, while fixing the warning, also guarantee we correctly pad the field.
The only caller sets it to "IGT", so previously we would set the field
would alway be 'IGT\n\0\0\0\0\0\0\0\0\0', since all the callers
zero-initialize the struct.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_edid.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/igt_edid.c b/lib/igt_edid.c
index 6fe984d9..df346c4c 100644
--- a/lib/igt_edid.c
+++ b/lib/igt_edid.c
@@ -31,6 +31,7 @@
 #include <time.h>
 #include <xf86drmMode.h>
 
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_edid.h"
 
@@ -183,10 +184,14 @@ void detailed_timing_set_string(struct detailed_timing *dt,
 
 	np->type = type;
 
-	strncpy(ds->str, str, sizeof(ds->str));
-	len = strlen(str);
+	len = min(strlen(str), sizeof(ds->str));
+	memcpy(ds->str, str, len);
+
 	if (len < sizeof(ds->str))
-		ds->str[len] = '\n';
+		ds->str[len++] = '\n';
+
+	while (len < sizeof(ds->str))
+		ds->str[len++] = ' ';
 }
 
 /**
-- 
2.31.1
