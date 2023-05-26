Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8310E6C0
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 13:38:08 +0000 (UTC)
Date: Fri, 26 May 2023 15:37:44 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230526153744.114d8456@maurocar-mobl2>
In-Reply-To: <20230526122047.5nxvhb2xptxv6fyg@kamilkon-desk1>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
 <20230522142201.2527800-7-mauro.chehab@linux.intel.com>
 <20230526122047.5nxvhb2xptxv6fyg@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] scripts/doc_to_xls.py: add an
 script to generate a doc spreadsheet
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 26 May 2023 14:20:47 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
> 
> On 2023-05-22 at 16:22:01 +0200, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > Add a script to convert documentation to a spreadsheet.
> > 
> > The logic here can read multiple config files. It will retrieve
> > documentation from the files that are configured inside each input
> > JSON file.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>  
> 
> imho it is worth to add examples of useage here or as comments
> in source code.
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil

Good point. I'll add it to the script's help:

$ scripts/doc_to_xls.py --help
usage: doc_to_xls.py [-h] --config CONFIG [CONFIG ...] [--include-plan] --xls XLS

Write the contents of the testplan documentation to a XLS file.

options:
  -h, --help            show this help message and exit
  --config CONFIG [CONFIG ...]
                        JSON file describing the test plan template
  --include-plan        Include test plans, if any.
  --xls XLS             Output XLS file.

Examples:

1. Create a XLS file with a single worksheet with Xe driver documentation:

   scripts/doc_to_xls.py --config tests/kms_*json tests/*/*.json --xls igt_test_documentation.xls

2. Create a XLS file with one sheet per driver, for all drivers with testplan config files and KMS:

   scripts/doc_to_xls.py --config tests/kms_*json tests/*/*.json --xls igt_test_documentation.xls


I'll fold the enclosed diff at the patch and add your A-B.

Regards,
Mauro

---

diff --git a/scripts/doc_to_xls.py b/scripts/doc_to_xls.py
index 1f33c1828ceb..8531eeb81779 100755
--- a/scripts/doc_to_xls.py
+++ b/scripts/doc_to_xls.py
@@ -8,7 +8,19 @@
 ## Allow keeping inlined test documentation and validate   ##
 ## if the documentation is kept updated.                   ##
 
-"""Maintain test plan and test implementation documentation on IGT."""
+"""Write the contents of the testplan documentation to a XLS file."""
+
+EPILOG="""
+Examples:
+
+1. Create a XLS file with a single worksheet with Xe driver documentation:
+
+   scripts/doc_to_xls.py --config tests/kms_*json tests/*/*.json --xls igt_test_documentation.xls
+
+2. Create a XLS file with one sheet per driver, for all drivers with testplan config files and KMS:
+
+   scripts/doc_to_xls.py --config tests/kms_*json tests/*/*.json --xls igt_test_documentation.xls
+"""
 
 import argparse
 
@@ -16,9 +28,9 @@ from openpyxl import Workbook
 
 from test_list import TestList
 
-parser = argparse.ArgumentParser(description = "Print formatted kernel documentation to stdout.",
-                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter,
-                                 epilog = 'If no action specified, assume --rest.')
+parser = argparse.ArgumentParser(description=__doc__,
+                                 formatter_class = argparse.RawDescriptionHelpFormatter,
+                                 epilog = EPILOG)
 parser.add_argument("--config", required = True,  nargs='+',
                     help="JSON file describing the test plan template")
 parser.add_argument("--include-plan", action="store_true",
