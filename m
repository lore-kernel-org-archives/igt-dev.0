Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF77810E6BC
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 22:59:33 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a15so4648132ljb.7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Nov 2022 14:59:33 -0800 (PST)
From: Daniil Tatianin <99danilt@gmail.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 18 Nov 2022 01:59:07 +0300
Message-Id: <20221117225907.793-1-99danilt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1] tools/intel_gtt: stop confusing GTT and BAR
 sizes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniil Tatianin <99danilt@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The GTT iteration loop would erroneously check "< gtt_size" as an
indicator for when it should stop, which would make it exit the loop
right after dumping 2-8 mib of address space depending on the
GPU generation.

Calculate the actual size of GTT in 'gtt_max_addr', and rewrite the
iteration loop to use it. While at it, also make virtual addresses
64-bit so that they don't wrap around at the 4GiB mark.

Signed-off-by: Daniil Tatianin <99danilt@gmail.com>
---
 tools/intel_gtt.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tools/intel_gtt.c b/tools/intel_gtt.c
index 311694ba..c0f3d16a 100644
--- a/tools/intel_gtt.c
+++ b/tools/intel_gtt.c
@@ -96,6 +96,11 @@ static uint64_t get_phys(uint32_t pt_offset)
 	return (phys | pae) & ~0xfff;
 }

+static int get_pte_size(void)
+{
+	return intel_gen(devid) < 8 ? 4 : 8;
+}
+
 static void pte_dump(int size, uint32_t offset) {
 	int pte_size;
 	int entries;
@@ -105,11 +110,7 @@ static void pte_dump(int size, uint32_t offset) {
 	if (size % 16)
 		size = (size + 16) & ~0xffff;

-	if (intel_gen(devid) < 8)
-		pte_size = 4;
-	else
-		pte_size = 8;
-
+	pte_size = get_pte_size();
 	entries = size / pte_size;

 	printf("GTT offset   |                 %d PTEs (%d MB)\n", entries,
@@ -139,7 +140,8 @@ static void pte_dump(int size, uint32_t offset) {
 int main(int argc, char **argv)
 {
 	struct pci_device *pci_dev;
-	unsigned int start, gtt_size;
+	unsigned gtt_size;
+	uint64_t start, gtt_max_addr;
 	int flag[] = {
 		PCI_DEV_MAP_FLAG_WRITE_COMBINE,
 		PCI_DEV_MAP_FLAG_WRITABLE,
@@ -190,14 +192,15 @@ int main(int argc, char **argv)
 		return 0;
 	}

-	for (start = 0; start < gtt_size; start += KB(4)) {
-		uint64_t start_phys = get_phys(start);
-		uint32_t end;
+	gtt_max_addr = (gtt_size / get_pte_size()) * KB(4ull);
+
+	for (start = 0; start < gtt_max_addr; start += KB(4)) {
+		uint64_t end, start_phys = get_phys(start);
 		int constant_length = 0;
 		int linear_length = 0;

 		/* Check if it's a linear sequence */
-		for (end = start + KB(4); end < gtt_size; end += KB(4)) {
+		for (end = start + KB(4); end < gtt_max_addr; end += KB(4)) {
 			uint64_t end_phys = get_phys(end);
 			if (end_phys == start_phys + (end - start))
 				linear_length++;
@@ -205,7 +208,7 @@ int main(int argc, char **argv)
 				break;
 		}
 		if (linear_length > 0) {
-			printf("0x%08x - 0x%08x: linear from "
+			printf("0x%08" PRIx64 "- 0x%08" PRIx64 ": linear from "
 			       "0x%" PRIx64 " to 0x%" PRIx64 "\n",
 			       start, end - KB(4),
 			       start_phys, start_phys + (end - start) - KB(4));
@@ -214,7 +217,7 @@ int main(int argc, char **argv)
 		}

 		/* Check if it's a constant sequence */
-		for (end = start + KB(4); end < gtt_size; end += KB(4)) {
+		for (end = start + KB(4); end < gtt_max_addr; end += KB(4)) {
 			uint64_t end_phys = get_phys(end);
 			if (end_phys == start_phys)
 				constant_length++;
@@ -222,13 +225,14 @@ int main(int argc, char **argv)
 				break;
 		}
 		if (constant_length > 0) {
-			printf("0x%08x - 0x%08x: constant 0x%" PRIx64 "\n",
+			printf("0x%08" PRIx64 " - 0x%08" PRIx64
+				": constant 0x%" PRIx64 "\n",
 			       start, end - KB(4), start_phys);
 			start = end - KB(4);
 			continue;
 		}

-		printf("0x%08x: 0x%" PRIx64 "\n", start, start_phys);
+		printf("0x%08" PRIx64 ": 0x%" PRIx64 "\n", start, start_phys);
 	}

 	return 0;
--
2.36.1.windows.1
