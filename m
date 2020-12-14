Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B806E17A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 21:10:52 +0000 (UTC)
Received: by mail-qv1-f69.google.com with SMTP id y4so6882862qvk.11
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Dec 2020 13:10:46 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Mon, 14 Dec 2020 16:10:24 -0500
Message-Id: <20201214211024.142704-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] resultgen: avoid null pointer dereference
 from realloc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

realloc() and friends return NULL if they fail; simplify the
new_escaped_json_string() by allocating all the necessary memory
up-front and checking for a failed allocation.

new_escaped_json_string() can already return NULL since
json_oject_new_string_len() returns NULL for various undocumented error
paths, and NULL is valid input for json_object_object_add(), which this
new_escaped_json_string() is currently exclusively used with. Thus,
returning NULL when memory allocation fails should be safe.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 runner/resultgen.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 3fe83b43..46007803 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -412,14 +412,21 @@ static struct json_object *new_escaped_json_string(const char *buf, size_t len)
 	size_t strsize = 0;
 	size_t i;
 
+	/*
+	 * Test output may be garbage; strings passed to json-c need to be
+	 * UTF-8 encoded so any non-ASCII characters are converted to their
+	 * UTF-8 representation, which requires 2 bytes per character.
+	 */
+	str = malloc(len * 2);
+	if (!str)
+		return NULL;
+
 	for (i = 0; i < len; i++) {
 		if (buf[i] > 0 && buf[i] < 128) {
-			str = realloc(str, strsize + 1);
 			str[strsize] = buf[i];
 			++strsize;
 		} else {
 			/* Encode > 128 character to UTF-8. */
-			str = realloc(str, strsize + 2);
 			str[strsize] = ((unsigned char)buf[i] >> 6) | 0xC0;
 			str[strsize + 1] = ((unsigned char)buf[i] & 0x3F) | 0x80;
 			strsize += 2;
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
