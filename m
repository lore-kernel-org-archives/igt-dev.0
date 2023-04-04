Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E210E1E5
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 15:47:18 +0000 (UTC)
Date: Tue, 4 Apr 2023 17:47:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230404154715.ossygzvv5c7dbq2l@kamilkon-desk1>
References: <20230328135434.2511771-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230328135434.2511771-1-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/igt_doc.py: improve check tool
 to look at the right files
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
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On 2023-03-28 at 15:54:34 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> We can't rely only at the prefix, as a test list could include files
> from other places.
> 
> So, add a logic to look into the files listed at the configuration
- ^^^
s/So, add/Added/

> file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/igt_doc.py | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index 92d925c451ed..f52d458bec60 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -757,11 +757,18 @@ class TestList:
>  
>          """Compare documented subtests with the IGT test list"""
>  
> +        test_prefixes = {}
> +
> +        for cfg_file in self.config["files"]:
> +            prefix = "^igt@" + re.sub(r"(.*/)?(.*)\.[ch]",r"\2", cfg_file)
-------------------------------------------------------- ^
imho headers do not contain any tests ?

Regards,
Kamil

> +            test_prefixes[prefix] = 1
> +
>          doc_subtests = sorted(self.get_subtests()[""])
>  
>          for i in range(0, len(doc_subtests)): # pylint: disable=C0200
>              doc_subtests[i] = re.sub(r'\<[^\>]+\>', r'\\d+', doc_subtests[i])
>  
> +        # Just to optimize the runner
>          test_prefix = os.path.commonprefix(doc_subtests)
>  
>          # Get a list of tests from
> @@ -775,7 +782,17 @@ class TestList:
>              print("Error:", sub_err)
>              sys.exit(1)
>  
> -        run_subtests = sorted(result.stdout.splitlines())
> +        run_subtests = []
> +        for subtest in result.stdout.splitlines():
> +            found = 0
> +            for prefix in test_prefixes.keys():
> +                if re.match(prefix, subtest):
> +                    found = 1
> +                    break
> +            if found:
> +                run_subtests.append(subtest)
> +
> +        run_subtests = sorted(run_subtests)
>  
>          # Compare arrays
>  
> -- 
> 2.39.2
> 

