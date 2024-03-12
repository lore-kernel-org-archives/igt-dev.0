Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E8DC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 16:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877E610F49A;
	Tue, 12 Mar 2024 16:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyYwTMX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3662E10F49A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710261841; x=1741797841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+SRvve953gQHDLDH5TwYYCn7Eu4nt2kCreXsHk7iw+U=;
 b=LyYwTMX7Az9AKPVyqjKMvNn5sdHw0yHDvJmd7OdAKpQQ1Uj4ied8+aRY
 fN7psQSZA8sosme5EKGDfJHiDT+Nu7k3IJNkW1C+oQeJc0tBeBd19zvX8
 FBPsF9b6Ebjl3vlDTkE8Vcro+Jr1vRllIucD1NTcWpMg/wc9GYaokrM//
 CQugND9sUILgQYaWz7Rmn5xYGWVZvl1Kw4GY2lXiR6mot0JyGh2GanEWh
 CX2EgRBHcK1QOL3DNqhrsR4DB7vJVIKD7CYpvA0jo71gOErAOCElSntqQ
 0OTr8kwCB/XH+UAvs3T2zn6sYhvgfIE5IRB9wwqG5W8dd/Dy8fwmQH3bb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8751764"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8751764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 09:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12017511"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 09:19:23 -0700
Date: Tue, 12 Mar 2024 17:19:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] scripts/xls_to_doc.py: use a main() function
Message-ID: <20240312161920.dorw75iammzdthxx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240311130220.982606-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240311130220.982606-1-mauro.chehab@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Mauro,
On 2024-03-11 at 14:02:20 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Move the main code to a function, called only when the script
> is executed directly from command line.
> 
> That allows the method to be re-used by other scripts if needed.
> 
> No functional changes.

pylint found some problems:

pylint scripts/xls_to_doc.py
************* Module xls_to_doc
scripts/xls_to_doc.py:68:0: W0311: Bad indentation. Found 20 spaces, expected 16 (bad-indentation)
scripts/xls_to_doc.py:69:0: W0311: Bad indentation. Found 20 spaces, expected 16 (bad-indentation)
scripts/xls_to_doc.py:70:0: W0311: Bad indentation. Found 24 spaces, expected 20 (bad-indentation)
scripts/xls_to_doc.py:68:29: R1733: Unnecessary dictionary index lookup, use 'item' instead (unnecessary-dict-index-lookup)

-----------------------------------
Your code has been rated at 9.82/10

Regards,
Kamil

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/xls_to_doc.py | 47 +++++++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
> index 510ab54276ba..fdf98105cd4b 100755
> --- a/scripts/xls_to_doc.py
> +++ b/scripts/xls_to_doc.py
> @@ -293,32 +293,35 @@ class FillTests(TestList):
>  # Main
>  ######
>  
> -parser = argparse.ArgumentParser(description=__doc__,
> -                                    formatter_class = argparse.ArgumentDefaultsHelpFormatter,
> -                                    argument_default = argparse.SUPPRESS,
> -                                    epilog = EPILOG)
> -parser.add_argument("--config", required = True,
> -                    help="JSON file describing the test plan template")
> -parser.add_argument("--xls", required = True,
> -                    help="Input XLS file.")
> -parser.add_argument("--sheets", nargs = "*",
> -                    help="Input only some specific sheets from the XLS file.")
> -parser.add_argument('--ignore-lists',action='store_false', default=True, help='Ignore fields that are updated via test lists')
> +def main():
> +    parser = argparse.ArgumentParser(description=__doc__,
> +                                        formatter_class = argparse.ArgumentDefaultsHelpFormatter,
> +                                        argument_default = argparse.SUPPRESS,
> +                                        epilog = EPILOG)
> +    parser.add_argument("--config", required = True,
> +                        help="JSON file describing the test plan template")
> +    parser.add_argument("--xls", required = True,
> +                        help="Input XLS file.")
> +    parser.add_argument("--sheets", nargs = "*",
> +                        help="Input only some specific sheets from the XLS file.")
> +    parser.add_argument('--ignore-lists',action='store_false', default=True, help='Ignore fields that are updated via test lists')
>  
> -parse_args = parser.parse_args()
> +    parse_args = parser.parse_args()
>  
> -fill_test = FillTests(parse_args.config)
> +    fill_test = FillTests(parse_args.config)
>  
> -if "sheets" not in parse_args:
> -    parse_args.sheets = None
> +    if "sheets" not in parse_args:
> +        parse_args.sheets = None
>  
> -fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
> +    fill_test.parse_spreadsheet(parse_args.xls, parse_args.sheets)
>  
> -## DEBUG: remove it later on
> -with open("fill_test.json", "w", encoding='utf8') as write_file:
> -    json.dump(fill_test.tests, write_file, indent = 4)
> -with open("doc.json", "w", encoding='utf8') as write_file:
> -    json.dump(fill_test.doc, write_file, indent = 4)
> +    ## DEBUG: remove it later on
> +    with open("fill_test.json", "w", encoding='utf8') as write_file:
> +        json.dump(fill_test.tests, write_file, indent = 4)
> +    with open("doc.json", "w", encoding='utf8') as write_file:
> +        json.dump(fill_test.doc, write_file, indent = 4)
>  
> +    fill_test.update_test_files(parse_args)
>  
> -fill_test.update_test_files(parse_args)
> +if __name__ == '__main__':
> +    main()
> -- 
> 2.43.2
> 
